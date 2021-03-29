import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _gender = 1;
  double bsi = 0.0, resultAbsiZ = 0.0;

  TextEditingController _ageTextEditingController = new TextEditingController();
  TextEditingController _heightTextEditingController =
      new TextEditingController();
  TextEditingController _weightTextEditingController =
      new TextEditingController();
  TextEditingController _waistTextEditingController =
      new TextEditingController();

  double absi = 0.0, absiZscore = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.greenAccent,
      ),
      title: 'Material App',
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            'ABSI CALCULATOR',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              letterSpacing: 3.0,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            decoration: myBoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //sex
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\t\t\t\tSex :",
                        style: new TextStyle(
                            fontSize: 22.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w500,
                            fontFamily: "Roboto"),
                      ),
                      DropdownButton(
                        value: _gender,
                        items: [
                          DropdownMenuItem(
                            child: Text('Male',
                                style: new TextStyle(
                                    fontSize: 22.0,
                                    color: const Color(0xFF000000),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Roboto")),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text('Female',
                                style: new TextStyle(
                                    fontSize: 22.0,
                                    color: const Color(0xFF000000),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Roboto")),
                            value: 2,
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _gender = value;
                          });
                        },
                      ),
                    ]),

                SizedBox(
                  height: 15,
                ),
                //age
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\t\t\t\tAge : ',
                        style: new TextStyle(
                            fontSize: 22.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w500,
                            fontFamily: "Roboto"),
                      ),
                      Container(
                          width: 250,
                          child: TextField(
                            controller: _ageTextEditingController,
                            keyboardType: TextInputType.numberWithOptions(),
                            style: new TextStyle(
                              fontSize: 22.0,
                              color: const Color(0xFF000000),
                              fontWeight: FontWeight.w200,
                              fontFamily: "Roboto",
                            ),
                            decoration: new InputDecoration(
                              filled: true,
                              labelText: '(years)',
                              labelStyle:
                                  TextStyle(fontWeight: FontWeight.w400),
                              hintText: 'The highest age is 2.',
                              hintStyle: TextStyle(
                                fontSize: 13,
                                color: Colors.red,
                                fontWeight: FontWeight.w300,
                              ),
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                              ),
                            ),
                          )),
                    ]),
                SizedBox(
                  height: 10,
                ),

                //height
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\t\t\t\tHeight : ',
                        style: new TextStyle(
                            fontSize: 22.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w500,
                            fontFamily: "Roboto"),
                      ),
                      Container(
                          width: 250,
                          child: TextField(
                            controller: _heightTextEditingController,
                            keyboardType: TextInputType.numberWithOptions(),
                            style: new TextStyle(
                              fontSize: 22.0,
                              color: const Color(0xFF000000),
                              fontWeight: FontWeight.w200,
                              fontFamily: "Roboto",
                            ),
                            decoration: new InputDecoration(
                              filled: true,
                              labelText: '(cm)',
                              labelStyle:
                                  TextStyle(fontWeight: FontWeight.w400),
                              hintText: 'Please enter the correct height.',
                              hintStyle: TextStyle(
                                fontSize: 13,
                                color: Colors.red,
                                fontWeight: FontWeight.w300,
                              ),
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                              ),
                            ),
                          ))
                    ]),
                SizedBox(
                  height: 10,
                ),

                //weight
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\t\t\t\tWeight:',
                        style: new TextStyle(
                            fontSize: 22.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w500,
                            fontFamily: "Roboto"),
                      ),
                      Container(
                          width: 250,
                          child: TextField(
                            controller: _weightTextEditingController,
                            keyboardType: TextInputType.numberWithOptions(),
                            style: new TextStyle(
                              fontSize: 22.0,
                              color: const Color(0xFF000000),
                              fontWeight: FontWeight.w200,
                              fontFamily: "Roboto",
                            ),
                            decoration: new InputDecoration(
                              filled: true,
                              labelText: '(kg)',
                              labelStyle:
                                  TextStyle(fontWeight: FontWeight.w400),
                              hintText: 'Please enter the correct weight.',
                              hintStyle: TextStyle(
                                fontSize: 13,
                                color: Colors.red,
                                fontWeight: FontWeight.w300,
                              ),
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                              ),
                            ),
                          )),
                    ]),
                SizedBox(
                  height: 10,
                ),

                //waist
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\t\t\t\tWaist circumference : ',
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w500,
                            fontFamily: "Roboto"),
                      ),
                      Container(
                          width: 250,
                          child: TextField(
                            controller: _waistTextEditingController,
                            keyboardType: TextInputType.numberWithOptions(),
                            style: new TextStyle(
                              fontSize: 22.0,
                              color: const Color(0xFF000000),
                              fontWeight: FontWeight.w200,
                              fontFamily: "Roboto",
                            ),
                            decoration: new InputDecoration(
                              filled: true,
                              labelText: '(cm)',
                              labelStyle:
                                  TextStyle(fontWeight: FontWeight.w400),
                              hintText: 'Need to be greater than 30cm.',
                              hintStyle: TextStyle(
                                fontSize: 13,
                                color: Colors.red,
                                fontWeight: FontWeight.w300,
                              ),
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                              ),
                            ),
                          )),
                    ]),
                SizedBox(
                  height: 50,
                ),

                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  new MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    elevation: 5.0,
                    minWidth: 200.0,
                    height: 50,
                    color: Colors.greenAccent,
                    child: new Text('Results',
                        style:
                            new TextStyle(fontSize: 25.0, color: Colors.black)),
                    onPressed: _calculateABSI,
                  ),
                ]),

                SizedBox(
                  height: 20,
                ),

                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  new Text(
                    "ABSI:  $absi",
                    style: new TextStyle(
                        fontSize: 30.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Merriweather'),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: unused_element
  void _calculateABSI() {
    setState(() {
      double _height = double.parse(_heightTextEditingController.text);
      double _weight = double.parse(_weightTextEditingController.text);
      double _waistc = double.parse(_waistTextEditingController.text);
      double _heightM = _height / 100;
      double _waistM = _waistc / 100;
      double bmi = _weight / (_heightM * _heightM);
      absi = _waistM / (pow(bmi, (2 / 3)) * pow(_heightM, (1 / 2)));
      absi = double.parse(absi.toStringAsFixed(4));
      print(absi);
    });
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: Colors.green,
        width: 2,
      ),
    );
  }
}
