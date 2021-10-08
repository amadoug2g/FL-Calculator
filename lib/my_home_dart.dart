import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({Key? key}) : super(key: key);

  @override
  _MyCalculator createState() => _MyCalculator();
}

class _MyCalculator extends State<MyHomeApp> {
  //region Variables
  String input = "0";
  String result = "0";
  String expression = "";
  double inputSize = 20.0;
  double resultSize = 20.0;
  //endregion

  //region Functions
  TextButton displayTextButton(String text, double fontSize,
      {Color color = Colors.white, bool activated = true}) {
    TextButton child;

    if (activated) {
      child = TextButton(
          onPressed: () => buttonPress(text),
          onLongPress: () => buttonLongPress(text),
          style: TextButton.styleFrom(
            primary: Colors.grey,
          ),
          child: displayText(text, 20.0, color));
    } else {
      child = TextButton(
          onPressed: null,
          child: displayText(text, 20.0, color));
    }

    return child;
  }

  Text displayText(String text, double fontSize, Color color) {
    return Text(text, style: TextStyle(fontSize: fontSize, color: color, fontWeight: FontWeight.bold),);
  }

  void buttonLongPress(String text) {
    setState(() {
      if (text == "⌫") {
        input = "0";
        result = "0";
      }
    });

    HapticFeedback.mediumImpact();
  }

  void buttonPress(String text) {
    setState(() {
      if (text == "⌫") {
        if (input.length > 1) {
          input = input.substring(0,input.length-1);
        } else {
          input = "0";
        }
      } else if (text == "=") {
        expression = input;
        expression = input.replaceAll("×", "*");
        expression = input.replaceAll("÷", "/");

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
        input = "0";
      } else {
        if (input == "0") {
          input = text;
        } else {
          input += text;
        }
      }
    });

    HapticFeedback.lightImpact();
  }
  //endregion

  //region Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
        backgroundColor: Colors.red,
        toolbarHeight: 0.0,
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: <Widget> [
            Expanded(
              flex: 1,
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: <Widget> [
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(input, style: const TextStyle(fontSize: 60,),),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(result, style: const TextStyle(fontSize: 46,color: Colors.grey),),
                      ),
                    ],
                  ),
                ),
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
                          width: double.infinity,
                          color: const Color.fromRGBO(26, 115, 232, 1.0),
                          child: Row(
                            children: <Widget> [
                              Expanded(
                                child:
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget> [
                                      displayTextButton("INV", 20.0, activated: false),
                                      displayTextButton("%", 20.0),
                                      displayTextButton("π", 20.0),
                                    ],
                                  ),
                              ),
                              Expanded(
                                child:
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget> [
                                      displayTextButton("RAD", 20.0, activated: false),
                                      displayTextButton("ln", 20.0, activated: false),
                                      displayTextButton("e", 20.0, activated: false),
                                    ],
                                  ),
                              ),
                              Expanded(
                                child:
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget> [
                                      displayTextButton("sin", 20.0, activated: false),
                                      displayTextButton("log", 20.0, activated: false),
                                      displayTextButton("(", 20.0, activated: false),
                                    ],
                                  ),
                              ),
                              Expanded(
                                child:
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget> [
                                      displayTextButton("cos", 20.0, activated: false),
                                      displayTextButton("√", 20.0, activated: false),
                                      displayTextButton(")", 20.0, activated: false),
                                    ],
                                  ),
                              ),
                              Expanded(
                                child:
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget> [
                                      displayTextButton("tan", 20.0, activated: false),
                                      displayTextButton("^", 20.0, activated: false),
                                      displayTextButton("!", 20.0, activated: false),
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
                          width: double.infinity,
                          color: Colors.white,
                          child: Row(
                            children: <Widget> [
                              Expanded(
                                flex: 4,
                                child:
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget> [
                                    displayTextButton("7", 25.0, color: Colors.black),
                                    displayTextButton("4", 25.0, color: Colors.black),
                                    displayTextButton("1", 25.0, color: Colors.black),
                                    displayTextButton("0", 25.0, color: Colors.black),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child:
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget> [
                                    displayTextButton("8", 25.0,  color: Colors.black),
                                    displayTextButton("5", 25.0,  color: Colors.black),
                                    displayTextButton("2", 25.0,  color: Colors.black),
                                    displayTextButton(".", 25.0,  color: Colors.black),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child:
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget> [
                                    displayTextButton("9", 25.0,  color: Colors.black),
                                    displayTextButton("6", 25.0,  color: Colors.black),
                                    displayTextButton("3", 25.0,  color: Colors.black),
                                    displayTextButton("", 25.0,  color: Colors.black, activated: false),
                                  ],
                                ),
                              ),
                              const Expanded(
                                flex: 1,
                                child: VerticalDivider(
                                  thickness: 1,
                                  color: Color.fromRGBO(0, 0, 0, 0.2),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child:
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget> [
                                    displayTextButton("/", 25.0,  color: const Color.fromRGBO(26,115,232,1.0)),
                                    displayTextButton("*", 25.0,  color: const Color.fromRGBO(26,115,232,1.0)),
                                    displayTextButton("-", 25.0,  color: const Color.fromRGBO(26,115,232,1.0)),
                                    displayTextButton("+", 25.0,  color: const Color.fromRGBO(26,115,232,1.0)),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child:
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget> [
                                    // displayTextButton("C", 25.0, const Color.fromRGBO(26,115,232,1.0)),
                                    displayTextButton("⌫", 25.0,  color: const Color.fromRGBO(26,115,232,1.0)),
                                    displayTextButton("", 25.0,  color: const Color.fromRGBO(26,115,232,1.0), activated: false),
                                    displayTextButton("", 25.0,  color: const Color.fromRGBO(26,115,232,1.0), activated: false),
                                    displayTextButton("=", 25.0,  color: const Color.fromRGBO(26,115,232,1.0)),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
  //endregion
}