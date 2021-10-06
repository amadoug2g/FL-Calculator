
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({Key? key}) : super(key: key);

  @override
  _MyHomeAppState createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {

  void buttonClick(var name) {
    Fluttertoast.showToast(msg: "Pressing $name");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TwinZone"),
        backgroundColor: Colors.red,
      ),
      body: Image.asset(
        "asset/absd.png",
        height: 100,
        // frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        //   return Container(
        //     padding: EdgeInsets.all(50.0),
        //     margin: EdgeInsets.all(30),
        //     decoration: BoxDecoration(
        //       color: Colors.red,
        //       borderRadius: BorderRadius.circular(5),
        //       shape: BoxShape.rectangle
        //     ),
        //     child: child,
        //   );
        // },
      )

      // floatingActionButton: FloatingActionButton.extended(
      //   label: const Text("Extended"),
      //   icon: const Icon(Icons.android),
      //   onPressed: () => buttonClick("FAB"),
      //   backgroundColor: Colors.red[400],
      //   tooltip: "FAB",
      // ),
    );
  }
}