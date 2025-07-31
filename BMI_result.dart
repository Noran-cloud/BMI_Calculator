import 'package:flutter/material.dart';
import 'package:project2/BMI_calculator.dart';

class Result extends StatelessWidget {
  final double bmi;
  const Result({super.key,required this.bmi});
  
  String getCategory(){
      if(bmi < 18.5) return "UNDERWEIGHT";
      if(bmi >= 18.5 && bmi < 24.9) return 'NORAML';
      if (bmi >= 25.0 && bmi < 29.9) return 'OVERWEIGHT';
     return 'OBESE';
  }
  String getBMIMessage() {
    if (bmi < 18.5) {
      return "        You are underweight. \nTry to eat more and stay healthy.";
    }
    if (bmi >= 18.5 && bmi < 24.9) {
      return "You have a normal body weight. \n                   Good job!";
    }
    if (bmi >= 25.0 && bmi < 29.9) {
      return "You are slightly overweight. \n      Try to exercise more.";
    }
    return "                      You are obese. \nConsider consulting with a health expert.";
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Result',style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),backgroundColor: Color(0xFF0A0E21),),
      backgroundColor: Color(0xFF0A0E21),
      body: Column(
        children: [
          SizedBox(height: 30,),
          Container(
            height: 600,
            decoration: BoxDecoration(
              color: Colors.grey[800],
            ),
            child: Center(
              child: Column( 
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(getCategory(),style: TextStyle(color: const Color.fromARGB(255, 94, 219, 98),fontSize: 23,fontWeight: FontWeight.bold),),
                  SizedBox(height: 40,),
                  Text(bmi.toStringAsFixed(1),style: TextStyle(color: Colors.white,fontSize: 100,fontWeight: FontWeight.bold),),
                  SizedBox(height: 40,),
                  Text(getBMIMessage(),style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w400),),
                ],
              ),
            ),
          ), SizedBox(height: 15,),
                  Container(
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20) ,bottomRight: Radius.circular(20))
                    ),
                    child: ElevatedButton(
                      onPressed: (){ Navigator.push(context,MaterialPageRoute(builder: (context)=>BMI_Calculator()));}, 
                    child: Text('RE-CALCULATE',style: TextStyle(fontSize: 23,color: Colors.white),),style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),))
        ],
      )
    );
  }
}
