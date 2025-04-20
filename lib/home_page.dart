import 'package:flutter/material.dart';
import 'Search_sreen.dart';
import 'category_tab.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
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
  String keyWord=" ";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
          appBar: AppBar(
            leading: const SizedBox(
              width:0 ,
            ),
            title: SizedBox(
              width: 300,
              child: SearchBar(
                elevation: WidgetStateProperty.all(0),
                leading: const Icon(Icons.search,),
                hintText: "Search your news",
                onChanged: (value){
                  if(value.isEmpty){
                  }else{
                    setState(() {
                      keyWord = value;
                      //print(keyWord);
                    });
                   // print(value);
                  }
                },
              ),
            ),
            bottom:const TabBar(
                isScrollable:true,
              tabs: [
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
            //title:


            ),
          body: TabBarView(
              children:
              [
                SearchScreen(keyWord: keyWord),
                const CategoryTab(category: 'business',),
                const CategoryTab(category: 'entertainment',),
                const CategoryTab(category: 'general',),
                const CategoryTab(category: 'health',),
                const CategoryTab(category: 'science',),
                const CategoryTab(category: 'sports',),
                const CategoryTab(category: 'technology',),
              ]
          ),
      ),
    );
  }
}
/*void showAlertDialog(BuildContext context) {
  CupertinoAlertDialog alert = CupertinoAlertDialog(
    content: Container(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [

        Text(
          "الرجاء اضاقة مركبة واحدة علي الاقل لمواصلة عملية الحجز",
         // style: FontStyle.BlacksColore,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 60,
            width: 180,
            child: OutlinedButton(
                onPressed: () {

                },
               // style: ButtonsStyle.BlueButtonStyle,
                child: const Text(
                  "اضافة الان",
                 // style: FontStyle.WhiteBColor,
                )),
          ),
        )
      ]),
    ),
  );

  showDialog(
      context: context,
      builder: (BuildContext buildercontex) {
        return alert;
      });
}*/