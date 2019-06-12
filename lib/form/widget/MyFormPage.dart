import 'package:flutter/material.dart';

class MyFormPage extends StatefulWidget {
  MyFormPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyFormPageState createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
