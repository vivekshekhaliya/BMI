import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'YOUR BMI'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var Result = "";
  var bgColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body:Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 350.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("BMI",style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 30,),
                  TextField(
                    controller: wtController ,
                    decoration: InputDecoration(
                      label: Text("Enter Your Waight(In Kg)"),
                      prefixIcon: Icon(Icons.monitor_weight),
                    ),
                    keyboardType: TextInputType.number,

                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: ftController,
                    decoration: InputDecoration(
                      label: Text("Enter Your Height(In Feet)"),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: inController ,
                    decoration: InputDecoration(
                      label: Text("Enter Your Height(In Inch)"),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,

                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(onPressed: (){
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inController.text.toString();
                    if(wt!="" && ft!="" && inch!="")
                      {
                        var iwt=int.parse(wt);
                        var ift=int.parse(ft);
                        var iinch=int.parse(inch);

                        var tInch =(ift*12)+iinch;
                        var tCm = tInch*2.54;
                        var tm = tCm/100;
                        var bmi = iwt/(tm*tm);
                        var msg="";

                        if(bmi>25)
                        {
                          msg="You're OverWeight!!";
                          bgColor = Colors.orange.shade100;
                        }
                        else if(bmi<18)
                        {
                          msg="You're UnderWeight!!";
                          bgColor = Colors.red.shade100;
                        }
                        else
                        {
                          msg="You're Healthy!!";
                          bgColor = Colors.green.shade100;
                        }
                        setState(() {
                          Result = "$msg \n Your BMI id:${bmi.toStringAsFixed(2)}";
                        });


                      }
                    else
                    {
                      setState(() {
                        Result="Please fill all textbox !!";
                      });
                    }

                  }, child: Text("Calculate")),
                  Text(Result,style: TextStyle(fontSize: 16.0),),

                ],
              ),
            ),
        ),
      ),
    );
  }
}
