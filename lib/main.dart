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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CalculatorPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  CalculatorPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  int _counter = 0;
  final Calculator _calculator = CalculatorIncremental();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.centerRight,
            height: 150,
            child: Column(
              children: [
                Text(
                  _calculator.previewText,
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  _calculator.primaryText,
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Table(
                  children: [
                    TableRow(children: [
                      FlatButton(
                          onPressed: () {
                            setState(() {
                              _calculator.onNumberClick(7);
                            });
                          },
                          child: Text('7')),
                      FlatButton(
                          onPressed: () {
                            setState(() {
                              _calculator.onNumberClick(8);
                            });
                          },
                          child: Text('8')),
                      FlatButton(
                          onPressed: () {
                            setState(() {
                              _calculator.onNumberClick(9);
                            });
                          },
                          child: Text('9')),
                    ]),
                    TableRow(children: [
                      FlatButton(
                          onPressed: () {
                            setState(() {
                              _calculator.onNumberClick(4);
                            });
                          },
                          child: Text('4')),
                      FlatButton(
                          onPressed: () {
                            setState(() {
                              _calculator.onNumberClick(5);
                            });
                          },
                          child: Text('5')),
                      FlatButton(
                          onPressed: () {
                            setState(() {
                              _calculator.onNumberClick(6);
                            });
                          },
                          child: Text('6')),
                    ]),
                    TableRow(children: [
                      FlatButton(
                          onPressed: () {
                            setState(() {
                              _calculator.onNumberClick(1);
                            });
                          },
                          child: Text('1')),
                      FlatButton(
                          onPressed: () {
                            setState(() {
                              _calculator.onNumberClick(2);
                            });
                          },
                          child: Text('2')),
                      FlatButton(
                          onPressed: () {
                            setState(() {
                              _calculator.onNumberClick(3);
                            });
                          },
                          child: Text('3')),
                    ]),
                    TableRow(children: [
                      FlatButton(
                          onPressed: () {
                            setState(() {
                              _calculator.onNumberClick(9);
                            });
                          },
                          child: Text('0')),
                      FlatButton(
                          onPressed: () {
                            setState(() {
                              _calculator.onDotClick();
                            });
                          },
                          child: Text(',')),
                      FlatButton(
                          onPressed: () {
                            setState(() {
                              _calculator.onEvalClick();
                            });
                          },
                          child: Text('=')),
                    ]),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                        onPressed: () {
                          setState(
                                () {
                              _calculator.onBackspaceClick();
                            },
                          );
                        },
                        child: Icon(Icons.backspace_outlined)),
                    FlatButton(
                        onPressed: () {
                          setState(
                            () {
                              _calculator.onDivClick();
                            },
                          );
                        },
                        child: Text('/')),
                    FlatButton(
                        onPressed: () {
                          setState(() {
                            _calculator.onTimesClick();
                          });
                        },
                        child: Text('*')),
                    FlatButton(
                        onPressed: () {
                          setState(
                            () {
                              _calculator.onMinusClick();
                            },
                          );
                        },
                        child: Text('-')),
                    FlatButton(
                        onPressed: () {
                          setState(() {
                            _calculator.onPlusClick();
                          });
                        },
                        child: Text('+')),
                  ],
                ),
              )
            ],
          ))
        ],
      ),
    ));
  }
}

abstract class Calculator {
  String get primaryText;

  String get previewText;

  void onNumberClick(int number);

  void onBackspaceClick();

  void onDivClick();

  void onTimesClick();

  void onMinusClick();

  void onPlusClick();

  void onDotClick();

  void onEvalClick();
}

class CalculatorIncremental extends Calculator {
  String _previewText = '';
  String _primaryText = '';

  @override
  void onBackspaceClick() {
    _primaryText = 'onBackspaceClick';
  }

  @override
  void onDivClick() {
    _primaryText = 'onDivClick';
  }

  @override
  void onMinusClick() {
    _primaryText = 'onMinusClick';
  }

  @override
  void onNumberClick(int number) {
    _primaryText = 'onNumberClick';
  }

  @override
  void onPlusClick() {
    _primaryText = 'onPlusClick';
  }

  @override
  void onTimesClick() {
    _primaryText = 'onTimesClick';
  }

  @override
  String get previewText => _previewText;

  @override
  String get primaryText => _primaryText;

  @override
  void onDotClick() {
    _primaryText = 'onDotClick';
  }

  @override
  void onEvalClick() {
    _primaryText = 'onEvalClick';
  }
}
