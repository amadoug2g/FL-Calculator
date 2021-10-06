
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({Key? key}) : super(key: key);

  @override
  _MyCalculator createState() => _MyCalculator();
}

class _MyCalculator extends State<MyHomeApp> {
  String value = "1";

  void buttonClick() {
    Fluttertoast.showToast(msg: "Pressing $value");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
        backgroundColor: Colors.red,
        toolbarHeight: 0.0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: <Widget> [
            Expanded(
              flex: 1,
                child: Container(
                  color: Colors.white,
                  // height: MediaQuery.of(context).size.height * 0.5,
                )
            ),
            Expanded(
                flex: 2,
                child: Container(
                  color: Colors.lightGreenAccent,
                  child: Column(
                    children: <Widget> [
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Color.fromRGBO(26, 115, 232, 1.0),
                          child: Row(
                            children: <Widget> [
                              Expanded(
                                child:
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget> [
                                      TextButton(
                                        onPressed: () {
                                          value = "INV";
                                          buttonClick();
                                        },
                                        child: Text(
                                          "INV",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: null,
                                        child: Text(
                                          "%",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: null,
                                        child: Text(
                                          "PI",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                              ),
                              Expanded(
                                child:
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: const <Widget> [
                                      TextButton(
                                        onPressed: null,
                                        child: Text(
                                          "RAD",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: null,
                                        child: Text(
                                          "ln",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: null,
                                        child: Text(
                                          "e",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                              ),
                              Expanded(
                                child:
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: const <Widget> [
                                      TextButton(
                                        onPressed: null,
                                        child: Text(
                                          "sin",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: null,
                                        child: Text(
                                          "log",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: null,
                                        child: Text(
                                          "(",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                              ),
                              Expanded(
                                child:
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: const <Widget> [
                                      TextButton(
                                        onPressed: null,
                                        child: Text(
                                          "cos",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: null,
                                        child: Text(
                                          "√",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: null,
                                        child: Text(
                                          ")",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                              ),
                              Expanded(
                                child:
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: const <Widget> [
                                      TextButton(
                                        onPressed: null,
                                        child: Text(
                                          "tan",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: null,
                                        child: Text(
                                          "^",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: null,
                                        child: Text(
                                          "!",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                  // height: MediaQuery.of(context).size.height * 0.5,
                )
            ),
          ],
        ),
      )
    );
  }
}