// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color _iconColor1 = Colors.black;
  Color _iconColor2 = Colors.black;
  Color _iconColor3 = Colors.black;
  Color _iconColor4 = Colors.black;
  void _changeIconColor(int iconNumber) {
    setState(() {
      switch (iconNumber) {
        case 1:
          _iconColor1 = _iconColor1 == Colors.black ? Colors.red : Colors.black;
          break;
        case 2:
          _iconColor2 =
              _iconColor2 == Colors.black ? Colors.indigo : Colors.black;
          break;
        case 3:
          _iconColor3 =
              _iconColor3 == Colors.black ? Colors.indigo : Colors.black;
          break;
        case 4:
          _iconColor4 =
              _iconColor4 == Colors.black ? Colors.indigo : Colors.black;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mc Flutter'),
        ),
        body: IntrinsicHeight(
          child: Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.account_circle, size: 48.0),
                      Column(
                        children: [
                          Text("Flutter McFlutter",
                              style: TextStyle(fontSize: 23)),
                          Text("Experienced App Developer"),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("123 Main Street"), Text("(415) 555-0198")],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        _changeIconColor(1);
                      },
                      icon: Icon(Icons.accessibility),
                      color: _iconColor1,
                    ),
                    IconButton(
                      onPressed: () {
                        _changeIconColor(2);
                      },
                      icon: Icon(Icons.timer),
                      color: _iconColor2,
                    ),
                    IconButton(
                      onPressed: () {
                        _changeIconColor(3);
                      },
                      icon: Icon(Icons.phone_android),
                      color: _iconColor3,
                    ),
                    IconButton(
                      onPressed: () {
                        _changeIconColor(4);
                      },
                      icon: Icon(Icons.phone_iphone),
                      color: _iconColor4,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
