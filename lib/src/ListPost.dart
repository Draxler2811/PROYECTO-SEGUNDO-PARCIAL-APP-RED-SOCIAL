import 'package:flutter/material.dart';

class ListPost extends StatefulWidget {
  @override
  _ListPostState createState() => _ListPostState();
}

class _ListPostState extends State<ListPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Face"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        color: Colors.grey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Text(
                  "List",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
