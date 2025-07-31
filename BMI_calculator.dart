import 'package:flutter/material.dart';
import 'package:project2/BMI_result.dart';

class BMI_Calculator extends StatefulWidget {
  const BMI_Calculator({super.key});

  @override
  State<BMI_Calculator> createState() => _BMI_CalculatorState();
}

class _BMI_CalculatorState extends State<BMI_Calculator> {
  static int height = 140;
  int age = 0;
  static int weight = 0;
  Color color = Colors.grey.shade800;
  Color pressed = Colors.grey.shade700;
  String type = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 
        Text('BMI Calculator',style: TextStyle(color: Colors.grey[800],fontSize: 25,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Color(0xFF0A0E21),
        ),
      backgroundColor: Color(0xFF0A0E21),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    selectedGender('Male', Icons.male),
                    selectedGender('Female', Icons.female),
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                    width: 400,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius:BorderRadius.circular(20),
                    ),
                    child: Column( mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Height',style: TextStyle(color: Colors.white,fontSize: 20),),
                        RichText(text: 
                          TextSpan(children: [
                            TextSpan(text:'$height',style: TextStyle(color: Colors.white,fontSize: 45),),
                            TextSpan(text: 'cm',style: TextStyle(color: Colors.white,fontSize: 20))
                          ] ),
                          
                        ),
                        Slider(
                          value: height.toDouble(),
                          min: 100,
                          max: 220,
                          activeColor: Colors.pink,
                          onChanged: (value){
                            setState(() {
                            height = value.round();
                        });
                        }),
                      ],
                    ),
                ), SizedBox(height: 10,),
                Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    EnterData('Weight', weight, (){setState(() {
                      weight++;
                    });}, (){setState(() {
                     if(weight > 0) weight--;
                    });}),
                    EnterData('Age', age, (){setState(() {
                      age++;
                    });}, (){setState(() {
                      if(age > 0) age--;
                    });}),
                  ],
                ),
                SizedBox(height: 10,),
              ],
            ),
          ),
          Container(
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20) ,bottomRight: Radius.circular(20))
                    ),
                    child: ElevatedButton(
                      onPressed: (){ 
                       double heightInMeters = height / 100;
                        double bmi = weight / (heightInMeters * heightInMeters);
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>Result(bmi: bmi,)));}, 
                    child: Text('CALCULATE',style: TextStyle(fontSize: 23,color: Colors.white),),style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),))
        ],
      ),
    );
  }

  Widget selectedGender(String gender,IconData icon){
  return GestureDetector(
                    onTap: (){
                      setState(() {
                        type = gender;
                      });
                    },
                    child: Container(
                      width: 175,
                      height: 200,
                      decoration: BoxDecoration(
                        color: type == gender? Colors.grey.shade500 : Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(icon,size: 100,color: Colors.white,),
                          Text('$gender',style: TextStyle(fontSize: 25,color: Colors.white),),
                        ],
                      ),
                    ),
                  );
}

Widget EnterData(String data, int data_digits, VoidCallback onAdd, VoidCallback onRemove){
  return Container(
                    width: 175,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('$data',style: TextStyle(fontSize: 20,color: Colors.white),),
                        Text('$data_digits',style: TextStyle(fontSize: 45,color: Colors.white)),
                        Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [ 
                            Operators(Icons.remove,onRemove),
                            Operators(Icons.add,onAdd),
                          ],
                        ),                     
                      ],
                    ),
                  );
}

Widget Operators(IconData icon, VoidCallback onTap){
  return GestureDetector(
                onTap: onTap,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: pressed,
                    shape:BoxShape.circle 
                  ),
                  child: Icon(icon,color: Colors.white,size: 30,),
                ),
              );
}
}

