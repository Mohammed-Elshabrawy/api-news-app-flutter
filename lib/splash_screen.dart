import 'dart:async';
import 'package:flutter/material.dart';
import 'new.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return StartState();
  }
}

class StartState extends State<StatefulWidget>{
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async{
    var duration =  const Duration(seconds: 2);
    return Timer(duration, route);
  }
  route(){
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const MyAApp())
    );
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 200,),
            Image.asset("lib/consts/—Pngtree—vector globe icon_3787753.png"),
            const SizedBox(height: 20,),
            const Text("Welcome to My News App",style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20,),
            const LinearProgressIndicator(),
          ],
        ),
      );
}
}