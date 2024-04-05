import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({Key? key}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
        elevation: 4,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Title',
            ),
          ),
          SizedBox(height: 20,),
          TextField(
            decoration: InputDecoration(
              hintText: 'Description',
            ),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 7,
          ),
          SizedBox(height: 12,),
          ElevatedButton(
              onPressed: submitData ,
              child: Text(
                'Submit'
              ),
          ),
        ],
      ),
    );
  }

  Future <void> submitData () async {
    final title = titlecontroller.text;
    final description = descriptioncontroller.text;
    final body = {
      "title": "title",
      "description": "description",
      "is_completed": false
    };

    final url = "https://api.nstack.in/v1/todos";
    final uri = Uri.parse(url);
    final response = await http.post(uri, body: jsonEncode(body),
      headers: {
        'Content-Type': 'application/json'
      },
    );

    if (response.statusCode == 201) {
      titlecontroller.text = '';
      descriptioncontroller.text = '';
      showSuccessMessage('Creation Success');
    }
    else {
      showErrorMessage('Creation Failed');
    }
  }

    void showSuccessMessage(String message)
    {
      final snackbar = SnackBar(content: Text(message));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }

    void showErrorMessage(String message)
    {
      final snackbar = SnackBar(content: Text(message));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }
