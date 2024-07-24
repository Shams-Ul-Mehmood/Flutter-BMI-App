import 'package:flutter/material.dart';

import 'BMI.dart';

class BMI_App extends StatelessWidget
{
  @override
  Widget build(BuildContext buildContext)
  {
    return MaterialApp(
      title: "Body Mass Index",
      color: Colors.grey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: BMI(),
    );
  }
}