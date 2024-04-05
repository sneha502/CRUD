import 'package:flutter/material.dart';
import 'package:to_do_app/add_todopage.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
        elevation: 4,
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed:navigateToAddPage ,
        label: Text("+ Add",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  void navigateToAddPage()
  {
    final route = MaterialPageRoute(
        builder: (context) => AddTodoPage(),
    );
    Navigator.push(context, route);
  }
}
