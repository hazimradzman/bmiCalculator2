import 'package:flutter/material.dart';
import 'dart:math';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  double _heightvalue = 170;
  double _weightvalue = 60;
  double _bmi = 0;
  var _bmiResult = "normal";


  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: Text("BMI CALCULATOR"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  Text(
                    "BMI",
                    style: TextStyle(color: Colors.red, fontSize: 40),
                  ),
                  Text(
                    "Calculator",
                    style: TextStyle(color: Colors.red, fontSize: 40),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/f/f1/Heart_coraz%C3%B3n.svg/640px-Heart_coraz%C3%B3n.svg.png",width: 300,height: 200,),
                  Text("We care about your Health"),
                  SizedBox(
                    height: 8,
                  ),

                     Row(
                      children: [
                        Text(
                          "Height : ${_heightvalue.round().toString()} cm",
                          style: TextStyle(color: Colors.grey, fontSize: 30),),
                      ],
                    ),

                  Slider(
                      value: _heightvalue,
                      max: 200,
                      label: _heightvalue.round().toString(),
                      onChanged: (double value) {
                        print(value);
                        setState(() {
                          _heightvalue = value;

                        });
                      }),
                  Row(
                    children: [
                      Text("Weight: ${_weightvalue.round().toString()}"
                        , style: TextStyle(color: Colors.grey, fontSize: 30),),
                      Text("kg", style: TextStyle(color: Colors.grey, fontSize: 30),)
                    ],
                  ),
                  Slider(
                      value: _weightvalue ,
                      max: 200,
                      label: _weightvalue.round().toString(),
                      onChanged: (double value) {
                        print(value);
                        setState(() {
                          _weightvalue = value;
                        });
                      }),
                  TextButton.icon(onPressed: (

                      ){

                    double bmi = _weightvalue / pow(_heightvalue/100,2);
                    var bmiResult = "";

                    if(bmi<18.5){
                      bmiResult = "UnderWeight";
                    }
                    else if(bmi>30){
                      bmiResult = "Obese";
                    }
                    else if(bmi>25){
                      bmiResult = "OverWeight";
                    }
                    else {
                      bmiResult ="normal";
                    }

                    setState(() {
                      _bmi = bmi.roundToDouble();
                      _bmiResult = bmiResult;

                    });

                  }, icon: Icon(Icons.favorite), label: Text("Calculate")),
                  _bmi != 0
                      ? Text(
                    'Your BMI is ${_bmi.round()}',
                    style: TextStyle(fontSize: 20),)
                      : SizedBox(),
                  _bmi != 0
                      ? Text(
                    'Based on your bmi, You are:  ${_bmiResult}',
                    style: TextStyle(fontSize: 20),)
                      : SizedBox()






                ],


              ),
            ),
          ),
        ));
  }
}
