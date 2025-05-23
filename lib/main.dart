import 'package:flutter/material.dart';
import 'package:news_app/modules/splash_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(color: Colors.cyan),
            color: Colors.deepPurple,
          ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(

      ),
      debugShowCheckedModeBanner: false,
     home:const SplashScreen() ,
    );
  }
}
