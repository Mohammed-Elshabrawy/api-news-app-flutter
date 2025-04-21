import 'package:flutter/material.dart';
import 'Search_sreen.dart';
import 'category_tab.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return  const MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  with SingleTickerProviderStateMixin{
  String keyWord=" ";
  int currentIndex=0;
  late final _tabController = TabController(length: 8, vsync: this);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
            title: SizedBox(
             // width: 300,
              child: SearchBar(
                elevation: WidgetStateProperty.all(0),
                leading: const Icon(Icons.search,),
                hintText: "Search your news",
                onChanged: (value){
                  setState(() {
                    _tabController.index=0;
                  });
                  if(value.isEmpty){
                    setState(() {
                      keyWord = " ";
                    });
                  }else{
                    setState(() {
                      keyWord = value;
                    });
                  }
                },
              ),
            ),
            bottom:TabBar(
              labelColor: Colors.cyan,
              padding: const EdgeInsets.all(0),
              controller: _tabController,
                isScrollable:true,
              tabs: const [
              Tab(text: 'Search',),
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
            ),
          body: TabBarView(
            controller: _tabController,
              children:
              [
                SearchScreen(keyWord: keyWord,),
                const CategoryTab(category: 'business',),
                const CategoryTab(category: 'entertainment',),
                const CategoryTab(category: 'general',),
                const CategoryTab(category: 'health',),
                const CategoryTab(category: 'science',),
                const CategoryTab(category: 'sports',),
                const CategoryTab(category: 'technology',),
              ]
          ),
    );
  }
}