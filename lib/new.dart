import 'package:flutter/material.dart';
import 'package:news_app/science.dart';
import 'package:news_app/sports.dart';
import 'package:news_app/technology.dart';
import 'business.dart';
import 'businessus.dart';
import 'entertainment.dart';
import 'general.dart';
import 'health.dart';

class MyAApp extends StatelessWidget {
  const MyAApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MyHomePage(title: 'All News');

  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 8,
      child: Scaffold(
          appBar: AppBar(
              bottom:TabBar(
                isScrollable:true,
              tabs: [
              const Tab(text: 'business',),
              const Tab(text: 'business - US',),
              const Tab(text: 'entertainment',),
              const Tab(text: 'general',),
              const Tab(text: 'health',),
              const Tab(text: 'science',),
              const Tab(text: 'sports',),
              const Tab(text: 'technology',),

            ]
       ),

            backgroundColor: Theme.of(context).colorScheme.inversePrimary,

            title: Text(widget.title),
          ),
          body: TabBarView(
              children:
              [
                business(),
                businessus(),
                entertainment(),
                general(),
                health(),
                science(),
                sports(),
                technology(),
              ]
          ),

      ),
    );
  }
}
