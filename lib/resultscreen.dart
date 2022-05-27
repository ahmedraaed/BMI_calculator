



import 'package:bmicalculator/resultscreen.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {

   final bool isman;
   final int resultse;
    final int age;

  ResultScreen({
   required  this.isman,
   required this.age,
    required this.resultse,
});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RESULT"),
      ),
      body: Column(
        children: [
          Text("Gender : ${isman? 'Male':'female'} ",style: TextStyle( fontWeight: FontWeight.bold),),
          Text("REsult : $resultse",style: TextStyle( fontWeight: FontWeight.bold),),
          Text("Age : $age",style: TextStyle( fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}
