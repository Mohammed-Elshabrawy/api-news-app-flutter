import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Details.dart';


class sports extends StatelessWidget {
  const sports({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MyHomePage(title: 'api');
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List posts = [];

  Future getpost() async{
    var url ="https://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=ff07382cc1f84dc4870f8ed0d3def8b7";
    var response = await http.get(Uri.parse(url));
    var responseboady = jsonDecode(response.body);
    print(responseboady);
    return responseboady;

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        body:FutureBuilder(
          future: getpost(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount:20,
                  itemBuilder: (context,i){
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: InkWell(
                        onTap: () {
                          String author = snapshot.data['articles'][i]['author'];
                          String title = snapshot.data['articles'][i]['title'];
                          var  url = snapshot.data['articles'][i]['url'];
                          var  urlToImage = snapshot.data['articles'][i]['urlToImage'];
                          String publishedAt = snapshot.data['articles'][i]['publishedAt'];
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Details(author:author,title:title,url:url,publishedAt:publishedAt,urlToImage:urlToImage),));
                        },
                        child: Container(
                          height: 150,
                          width: 300,
                          decoration: BoxDecoration(color: Colors.cyan,
                              borderRadius: BorderRadius.circular(20)),

                          child: Center(

                            child: Text(
                              "${snapshot.data['articles'][i]['title']}",
                              style: TextStyle(
                                fontSize: 20, color: Colors.white,),
                              textAlign: TextAlign.center,),

                          ),
                        ),
                      ),
                    );
                  }
              );
            } return  Center(child: CircularProgressIndicator(),);

          },
        )
            
    );
  }
}
