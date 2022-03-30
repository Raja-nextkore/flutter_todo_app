// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _todoList = [];
  final TextEditingController _titleController = TextEditingController();

  void _addTodos(String title) {
    setState(() {
      _todoList.add(title);
    });
  }

  List<Widget> _buildWidget() {
    List<Widget> _buildTodoWidget = [];
    for (String title in _todoList) {
      _buildTodoWidget.add(
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Card(
              color: Colors.blue,
              elevation: 3.0,
              child: ListTile(
                title: Text(
                  title,
                  style: GoogleFonts.rakkas(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      letterSpacing: .8,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      //backgroundColor: Colors.black,
                    ),
                  ),
                ),
              )),
        ),
      );
    }
    return _buildTodoWidget;
  }

  Future<dynamic> _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Add a task to your list',
              style: GoogleFonts.rakkas(
                textStyle: const TextStyle(
                  color: Colors.black,
                  letterSpacing: .8,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  //backgroundColor: Colors.black,
                ),
              ),
            ),
            content: TextField(
              controller: _titleController,
              onSubmitted: (value) {
                value.isEmpty ? Error() : _addTodos(_titleController.text);
              },
              decoration: InputDecoration(
                labelText: 'Enter task here',
                border: const OutlineInputBorder(),
                errorText: 'Can\'t be empty',
                errorStyle: GoogleFonts.raleway(
                  textStyle: const TextStyle(
                    color: Colors.red,
                    letterSpacing: .8,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    //backgroundColor: Colors.black,
                  ),
                ),
                labelStyle: GoogleFonts.raleway(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    letterSpacing: .8,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    //backgroundColor: Colors.black,
                  ),
                ),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'ADD',
                  style: GoogleFonts.raleway(
                    textStyle: const TextStyle(
                      color: Colors.blue,
                      letterSpacing: .8,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      //backgroundColor: Colors.black,
                    ),
                  ),
                ),
                onPressed: () {
                  if (_titleController.text.isEmpty) {
                    return;
                  }
                  Navigator.of(context).pop();
                  _addTodos(_titleController.text);
                  _titleController.clear();
                },
              ),
              FlatButton(
                child: Text(
                  'CANCEL',
                  style: GoogleFonts.raleway(
                    textStyle: const TextStyle(
                      color: Colors.red,
                      letterSpacing: .8,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      //backgroundColor: Colors.black,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  _titleController.clear();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: RichText(
          text: TextSpan(
            text: ' Flutter ',
            style: GoogleFonts.rakkas(
              textStyle: const TextStyle(
                  color: Colors.white,
                  letterSpacing: .8,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  backgroundColor: Colors.black),
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'Todo',
                style: GoogleFonts.abrilFatface(
                  textStyle: const TextStyle(
                      color: Colors.blue,
                      letterSpacing: .8,
                      backgroundColor: Colors.white),
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _displayDialog(context);
        },
        tooltip: 'Add todos',
        child: const Icon(Icons.add),
      ),
      body: ListView(
        children: _buildWidget(),
      ),
    );
  }
}
