import 'package:flutter/material.dart';

class Bmi extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return new BmiState();

    throw UnimplementedError();
  }

}
class BmiState extends State<Bmi>
{
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  double inches =0.0;
  double result = 0.0;
  String resultReading = "";
  String finalResult = "";


  void calculateBMI()
  {
    setState(() {
      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text);
      inches = height*12;
      double weight = double.parse(_weightController.text);

      if((_ageController.text.isNotEmpty || age>0) &&(_heightController.text.isNotEmpty || height>0) && (_weightController.text.isNotEmpty|| weight>0))
        {
          result = (weight/(inches*inches))*703; //our BMI

          // do the reading
          if(double.parse(result.toStringAsFixed(1))<18.5)   //it omits the long decimal number.
            {
              resultReading="Underweight";
              print(resultReading);
          }
          else if (double.parse(result.toStringAsFixed(1))>=18.5 && result <25)
            {
              resultReading =" Great Shape";
              print(resultReading);
            }
          else if(double.parse(result.toStringAsFixed(1))>=28.0 && result <30)
            {
              resultReading = " Overweight";
              print(resultReading);
            }
          else if(double.parse(result.toStringAsFixed(1)) >=30)
            {
              resultReading = " Obese";
              print(resultReading);
            }

        }
      else
        result=0.0;
    });

    finalResult = "Your BMI : ${result.toStringAsFixed(1)}";






  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),

      body: new Container(
        alignment:Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.0),
          children: <Widget>[
            new Image.asset('images/111 bmilogo.png',
            height: 85.0,
            width: 95.0),

            new Container(
              margin: const EdgeInsets.all(5.0),
              height: 245.0,
              width: 290.0,
              color: Colors.grey.shade300,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Age",
                      hintText: "Enter your Age",
                      icon: new Icon(Icons.person),
                    ),
                  ),

                  new TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Height",
                      hintText: "Enter your height in feets",
                      icon: new Icon(Icons.insert_chart),
                    ),
                  ),

                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Weight",
                      hintText: "Enter your weight in lbs",
                      icon: new Icon(Icons.line_weight),
                    ),
                  ),

                  new Padding(padding: const EdgeInsets.all(10.0)),
                  
                  // calculate button
                  new Container(
                    alignment: Alignment.center,
                    child: new RaisedButton(
                      onPressed: calculateBMI,//if the onpressed is set to null then the button will remain inactive and will not have the color specified.
                      color: Colors.pink.shade500,
                      child: new Text(" Calculate"),
                      textColor: Colors.white,

                    ),
                  
                    ),
                    
                  

                ],
              ),
            ),

            //BMI result
            new Container(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    "$finalResult",
                    style: new TextStyle(
                      color: Colors.blueAccent,
                      fontStyle: FontStyle.italic,
                      fontSize: 19.9,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  
                  //underweight, overweight, normal result showing
                  new Padding(padding: const EdgeInsets.all(10.0)),
                  
                  new Text(
                    "$resultReading",
                    style: new TextStyle(
                      color: Colors.blueAccent,
                      fontStyle: FontStyle.italic,
                      fontSize: 20.2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),








                ],
              ),

            )







          ],
        ),
      ),

    );
    throw UnimplementedError();
  }
  
}