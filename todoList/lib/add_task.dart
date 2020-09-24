import 'package:flutter/material.dart';

class AddTaskPage extends StatefulWidget {
  AddTaskPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final _taskFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pop(_taskFieldController.text);
        return;
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pop(_taskFieldController.text);
            },
            child: Icon(Icons.check),
          ),
          body: Column(
            children: [
              ListTile(
                title: TextFormField(
                  decoration: InputDecoration(hintText: 'Insert new task here'),
                  controller: _taskFieldController,
                ),
              )
            ],
          )),
    );
  }
}
