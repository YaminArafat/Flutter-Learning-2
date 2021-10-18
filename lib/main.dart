import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Row(
            //verticalDirection: VerticalDirection.up,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                child: Center(
                  child: Text(
                    "Container 1",
                  ),
                ),
                color: Colors.brown,
              ),
              SizedBox(
                width: 50,
              ),
              Container(
                child: Center(child: Text('Container 2')),
                color: Colors.deepPurple,
              )
            ],
          ),
        ),
      ),
    );
  }
}
