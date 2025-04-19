import 'package:flutter/material.dart';
import 'CategoryTab.dart';


class MyAApp extends StatelessWidget {
  const MyAApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  const MyHomePage(title: 'All News');

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
      length: 7,
      child: Scaffold(
          appBar: AppBar(
            leading: SizedBox(),
              bottom:const TabBar(
                isScrollable:true,
              tabs: [
              Tab(text: 'business',),
              Tab(text: 'entertainment',),
              Tab(text: 'general',),
              Tab(text: 'health',),
              Tab(text: 'science',),
              Tab(text: 'sports',),
              Tab(text: 'technology',),

            ]
       ),

            backgroundColor: Theme.of(context).colorScheme.inversePrimary,

            title: Text(widget.title),
          ),
          body: TabBarView(
              children:
              [
                CategoryTab(category: 'business',),
                CategoryTab(category: 'entertainment',),
                CategoryTab(category: 'general',),
                CategoryTab(category: 'health',),
                CategoryTab(category: 'science',),
                CategoryTab(category: 'sports',),
                CategoryTab(category: 'technology',),
              ]
          ),

      ),
    );
  }
}
