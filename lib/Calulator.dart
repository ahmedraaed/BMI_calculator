import 'dart:math';

import 'package:bmicalculator/resultscreen.dart';
import 'package:flutter/material.dart';

class calculator extends StatefulWidget {
  @override
  State<calculator> createState() => _calculator();
}

class _calculator extends State<calculator> {

  bool ismale=true;
  double height=180;

  int age =20;
  int weight=60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calclator",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(

                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            setState((){
                              ismale=true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ismale ? Colors.blue :Colors.grey[400],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(image: AssetImage('assets/image/mars.png',),width: 70,height: 70,),
                                SizedBox(height: 10),
                                Text("Male",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState((){
                              ismale=false;
                            });
                          },

                          child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: !ismale?Colors.blue : Colors.grey[400],

                          ),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(image: AssetImage('assets/image/femenine.png'),width: 70,height: 70,),
                              Text("Female",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            ],
                          ),
                      ),
                        ),),

                    ],
                  ),
                )),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black26,
              ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("HEIGHT",style: TextStyle(fontSize: 30, ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text("${height.round()}",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                        Text(
                          "CM",style: TextStyle(fontSize: 20,),),
                      ],
                    ),
                    Slider(value: height
                      ,max: 300
                      ,min: 120, onChanged: (value){
                      setState((){});
                      height=value;
                      print(value.round());},),

                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black26,
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Text("Age",style: TextStyle(fontSize:30,fontWeight: FontWeight.bold ),),
                          Text("$age",style: TextStyle(fontSize:40,fontWeight: FontWeight.bold ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(child: Icon(Icons.remove),onPressed: (){
                                setState((){age--;});
                              },),
                              FloatingActionButton(onPressed: (){
                                setState((){age++;});

                              },child: Icon(Icons.add),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),

                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black26,
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Text("WEIGHT",style: TextStyle(fontSize:30,fontWeight: FontWeight.bold ),),
                          Text("$weight",style: TextStyle(fontSize:40,fontWeight: FontWeight.bold ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              FloatingActionButton(child: Icon(Icons.remove),onPressed: (){
                                setState((){weight--;});

                              },),
                              FloatingActionButton(onPressed: (){
                                setState((){weight++;});

                              },child: Icon(Icons.add),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          Container(
              width: double.infinity,
              color: Colors.pink,
              child: MaterialButton(
                onPressed: () {
                  var result= weight/pow(height/100,2);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultScreen(isman:ismale,resultse: result.round(),age: age,)));
                },
                child: Text(
                  "CalCulate",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ))
        ],

      ),


    );
  }
}
