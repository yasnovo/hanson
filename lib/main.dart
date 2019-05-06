import 'package:flutter/material.dart';

void main() => runApp(new TodoApp());

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'TODO APP',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new TodoList(title: 'TODO Demo'),
    );
  }
}

class TodoList extends StatefulWidget {
  TodoList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  TodoListState createState() => new TodoListState();
}

class TodoListState extends State<TodoList> {
  //List<String> _todoItems = new List<String>();
  List<String> _todoItems = [];

//  void _addTodoItems() {
//    setState(() {
//       int index = _todoItems.length;
//      _todoItems.add('Item ' + index.toString());
//    });
//  }

  Widget _buildTodoList() {
    return ListView.builder(
          itemCount: _todoItems.length,
          itemBuilder: (context, int index) {
            if(index < _todoItems.length){
              return _buildTodoItem(index);
            }
          },
      );
  }

  Widget _buildTodoItem(int index) {
    return ListTile(
        title: Text('${_todoItems[index]}')
    );

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title), // 持ち回さなくてもいい
      ),
      body: _buildTodoList(),
      floatingActionButton: new FloatingActionButton(
        onPressed: _pushAddTodoScreen,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }


  void _pushAddTodoScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('add a new task'),
            ),
            body: TextField(
              autofocus: true,
              onSubmitted: (val) {
                _addTodoItem(val);
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                hintText: 'enter someting to do...',
                contentPadding: const EdgeInsets.all(16),
              ),
            ),
          );
        },
      ),
    );
  }

  void _addTodoItem(String task) {
    if(task.length > 0){
      setState(() => _todoItems.add(task));
    }
  }
}
