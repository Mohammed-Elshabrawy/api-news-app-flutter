import 'dart:async';
import 'package:flutter/material.dart';

import 'new.dart';


class Spalshscreen extends StatefulWidget {
  const Spalshscreen({super.key});


  @override
  State<StatefulWidget> createState() {
    return StartState();
  }
}


class StartState extends State<StatefulWidget>{
  @override
  void initState() {
    super.initState();
    StartTimer();
  }

  StartTimer() async{
    var duration =  const Duration(seconds: 2);
    return Timer(duration, route);
  }
  route(){
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => MyAApp())
    );
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 200,),
            Image.asset("lib/consts/—Pngtree—vector globe icon_3787753.png"),
            SizedBox(height: 20,),
            Text("Welcome to My News App",style: TextStyle(fontSize: 20)),
            SizedBox(height: 20,),
            LinearProgressIndicator(),
          ],
        ),
        
      );
}
}