import 'package:flutter/material.dart';
import 'package:todoapp/list_Page.dart';

class MyDoList extends StatefulWidget {
  MyDoList({
    super.key,
  });

  @override
  State<MyDoList> createState() => _MyDoListState();
}

class _MyDoListState extends State<MyDoList> {
  final _controller = TextEditingController();

  List toDoList = [];

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void check(int index) {
    setState(
      () {
        toDoList[index][1] = !toDoList[index][1];
      },
    );
  }

  void delete(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
appBar: AppBar(
  backgroundColor: Colors.amber,
title: Text('do to list'),
centerTitle: true,


),


      body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (BuildContext context, index) {
            return ListPage(
              taskName: toDoList[index][0],
              taskcompleted: toDoList[index][1],
              onChanged: (value) => check(index),
              deleteFunction: (context) => delete(index),
            );
          }),
      floatingActionButton: Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'add more task',
                filled: true,
                fillColor: Colors.grey,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          )),
          FloatingActionButton(
            onPressed: saveNewTask,
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
