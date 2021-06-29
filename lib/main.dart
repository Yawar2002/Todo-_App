import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: todoApp(),
    );
  }
}

// ignore: camel_case_types
class todoApp extends StatefulWidget {
  @override
  _todoAppState createState() => _todoAppState();
}

// ignore: camel_case_types
class _todoAppState extends State<todoApp> {
  var output = '';
  List<dynamic> mylist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO APP'),
        actions: [
          Icon(Icons.notifications),
          Padding(padding: EdgeInsets.only(right: 10)),
          Icon(Icons.login),
          Padding(padding: EdgeInsets.only(right: 10)),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        height: double.infinity,
        child: ListView.builder(
            itemCount: mylist.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(5.0),
                height: 60,
                color: Colors.cyan[200],
                child: ListTile(
                  title: Text(
                    '${mylist[index]}',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  trailing: Container(
                    width: 50,
                    child: Row(children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Edit Your Todo'),
                                      content: TextField(
                                        onChanged: (value) {
                                          output = value;
                                        },
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              mylist.replaceRange(
                                                  index, index + 1, {output});
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: Center(
                                              child:
                                                  Center(child: Text('Edit'))),
                                        )
                                      ],
                                    );
                                  });
                            });
                          },
                          child: Icon(
                            Icons.edit,
                            color: Colors.black,
                          )),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              mylist.removeAt(index);
                            });
                          },
                          child: Icon(
                            Icons.delete,
                            color: Colors.black,
                          )),
                    ]),
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Add Your Todo'),
                  content: TextField(
                    onChanged: (value) {
                      output = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          mylist.add(output);
                        });
                        Navigator.of(context).pop();
                      },
                      child: Center(child: Text('Add to List')),
                    )
                  ],
                );
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.cyan[900],
        ),
      ),
    );
  }
}
