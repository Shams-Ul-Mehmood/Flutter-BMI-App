import 'package:flutter/material.dart';

import 'BMI.dart';

class BMI_State extends State<BMI>
{
  var weight_TextEditorController = TextEditingController();
  var height_Feet_TextEditorController = TextEditingController();
  var height_Inch_TextEditorController = TextEditingController();
  var output = "";
  var background_Color = Colors.lightBlue.shade200;
  var message;

  @override
  Widget build(BuildContext buildContext)
  {
    return Scaffold(
      primary: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        primary: true,
        title: Text("BMI", style: TextStyle( fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white ),),
        titleSpacing: 9,
        centerTitle: true,
        elevation: 6,
      ),
      body: Container(
        color: background_Color,
        child: Center(
          child: Container(
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("BMI", style: TextStyle( fontSize: 35, fontWeight: FontWeight.w700, color: Colors.black87 ), ),
                SizedBox(height: 25,),
                TextField(
                  controller: weight_TextEditorController,
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text("Enter your Weight(in Kgs)"),
                    prefixIcon: Icon(Icons.line_weight_rounded)
                  ),
                ),
                SizedBox(height: 12,),
                TextField(
                  controller: height_Feet_TextEditorController,
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  decoration: InputDecoration(
                    label: Text("Enter your Height(in Feets)"),
                    prefixIcon: Icon(Icons.height),
                  ),
                ),
                SizedBox(height: 12,),
                TextField(
                  controller: height_Inch_TextEditorController,
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text("Enter your Height(in Inches)"),
                    prefixIcon: Icon(Icons.height),
                  ),
                ),
                SizedBox(height: 18,),
                ElevatedButton(onPressed: (){
                  var weight = weight_TextEditorController.text.toString();
                  var heightFeets = height_Feet_TextEditorController.text.toString();
                  var heightInches = height_Inch_TextEditorController.text.toString();

                  if( weight != "" && heightFeets != "" && heightInches != "" )
                    {
                          // Calculate BMI.
                       double weight_Value = double.parse( weight );
                       double height_Feets_Value = double.parse( heightFeets );
                       double height_Inches_Value = double.parse( heightInches );

                       // 1 inch is equal to 2.54 centimeters.
                       // 1 centimeter is equal to 1/100 meters.
                       // 1 feet is equal to 12 inches.
                       // 1 Inch is equal to 1/12 feets.

                       // Conversion Formula --------> Feets into Inches.
                       double total_Inches = ( height_Feets_Value * 12 ) + height_Inches_Value;

                       // Conversion Formula --------> Inches into Centimeters.
                       // total-centimeter = total-inches * 2.54

                       double total_Centimeter = total_Inches * 2.54;

                       // Conversion Formula --------> Centimeter into Meter.
                       // total-meter = total-centimeter/100.

                       double total_Meter = total_Centimeter / 100;

                       // BMI-Formula.
                       // total-bmi = total-weight / ( total-meter * total-meter )

                       double bmi = weight_Value / (total_Meter * total_Meter);

                       if( bmi < 18 )
                         {
                           background_Color = Colors.red;
                           message = "You're UnderWeight!!";
                         }
                       else if( bmi > 25 )
                         {
                            message = "You're OverWeight!!";
                            background_Color = Colors.purple.shade200;
                         }
                       else
                         {
                            background_Color = Colors.green.shade200;
                            message = "You're Healthy";
                         }

                       output = "${message}\nYour BMI is ${bmi.toStringAsFixed(2)}" ;

                       setState( () {} );
                    }
                  else
                    {
                      output = "Please fill all the required blanks!!!";
                      setState( (){} );
                    }

                }, child: Text("Calculate")),
                SizedBox(height: 15,),
                Text( output , style: TextStyle( fontSize: 20,  ), ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}