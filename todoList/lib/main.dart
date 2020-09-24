import 'package:flutter/material.dart';
import 'package:todoList/add_task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'To Do List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _tasks = new List();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            String newTask =
                await Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) => AddTaskPage(
                          title: 'Add a task',
                        )));
            if (newTask.isNotEmpty) {
              _tasks.add(newTask);
              setState(() {});
            }
          },
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: _tasks.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: ListTile(
                    title: new Text(
                      _tasks[index],
                      style: TextStyle(color: Colors.black),
                    ),
                    trailing: GestureDetector(
                        onTap: () {
                          _tasks.removeAt(index);
                          setState(() {});
                        },
                        child: Icon(Icons.done)),
                  ),
                ),
              );
            }));
  }
}
