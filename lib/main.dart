/* Simple Calculator */
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int firstnum;
  int secondnum;
  String text_to_display = "";
  String result;
  String operation;

  void btnclicked(String btnvalue) {
    if (btnvalue == 'C') {
      text_to_display = '';
      firstnum = 0;
      secondnum = 0;
      result = '';
    } else if (btnvalue == '+' ||
        btnvalue == '-' ||
        btnvalue == '*' ||
        btnvalue == '/') {
      firstnum = int.parse(text_to_display);
      result = '';
      operation = btnvalue;
    } else if (btnvalue == '=') {
      secondnum = int.parse(text_to_display);
      if (operation == '+') {
        result = (firstnum + secondnum).toString();
      }
      if (operation == '-') {
        result = (firstnum - secondnum).toString();
      }
      if (operation == '*') {
        result = (firstnum * secondnum).toString();
      }
      if (operation == '/') {
        result = (firstnum ~/ secondnum).toString();
      }
    } else {
      result = int.parse(text_to_display + btnvalue).toString();
    }
    setState(() {
      text_to_display = result;
    });
  }

  Widget custombutton(String btnvalue, Color clr) {
    return Expanded(
      child: OutlineButton(
        onPressed: () => btnclicked(btnvalue),
        padding: EdgeInsets.all(30),
        child: Text(
          '$btnvalue',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: clr,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          'Calculator',
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.grey[50],
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(20),
                child: Text(
                  "$text_to_display",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                custombutton('7', Colors.blueAccent),
                custombutton('8', Colors.blueAccent),
                custombutton('9', Colors.blueAccent),
                custombutton('+', Colors.black),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton('4', Colors.blueAccent),
                custombutton('5', Colors.blueAccent),
                custombutton('6', Colors.blueAccent),
                custombutton('-', Colors.black),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton('1', Colors.blueAccent),
                custombutton('2', Colors.blueAccent),
                custombutton('3', Colors.blueAccent),
                custombutton('*', Colors.black),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton('C', Colors.red),
                custombutton('0', Colors.blue),
                custombutton('=', Colors.green),
                custombutton('/', Colors.black),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
