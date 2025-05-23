import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'details.dart';

class SearchScreen extends StatelessWidget {
    const SearchScreen({super.key,required this.keyWord});
    final String keyWord;
    Future getSearch(String keyWord) async {
      var url = "https://newsapi.org/v2/everything?q=$keyWord&apiKey=3601c7b65bb54d3d913c49d936ae9928";
      var response = await http.get(Uri.parse(url));
      var responseBody = jsonDecode(response.body);
      return responseBody;
    }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: FutureBuilder(
          future: getSearch(keyWord),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if(keyWord==" "){
              return const Center(child: Text("Search Something"),);
            } else if (snapshot.hasData) {
              if(snapshot.data['status']=="error"){
                return  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text(snapshot.data['message']),),
                );
              }else if(snapshot.data['articles'].length==0||snapshot.data==null){
                return const Center(child: Text("No Data"),);
              }else{
                return ListView.builder(
                    itemCount: snapshot.data["articles"].length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: InkWell(
                          onTap: () {
                            String author , title ,description, url ,urlToImage,publishedAt,content;
                            author=title=url=urlToImage=publishedAt=content=description="none";
                            if(snapshot.data['articles'][i]['author']!=null){
                              author = snapshot.data['articles'][i]['author'];
                            }
                            if(snapshot.data['articles'][i]['description']!=null){
                              description = snapshot.data['articles'][i]['description'];
                            }
                            if(snapshot.data['articles'][i]['title']!=null){
                              title = snapshot.data['articles'][i]['title'];
                            }
                            if(snapshot.data['articles'][i]['url']!=null){
                              url = snapshot.data['articles'][i]['url'];
                            }
                            if(snapshot.data['articles'][i]['urlToImage']!=null){
                              urlToImage = snapshot.data['articles'][i]['urlToImage'];
                            }
                            if(snapshot.data['articles'][i]['publishedAt']!=null){
                              publishedAt = snapshot.data['articles'][i]['publishedAt'];
                            }
                            if(snapshot.data['articles'][i]['content']!=null){
                              content = snapshot.data['articles'][i]['content'];
                            }
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) => Details(author:author,title:title,url:url,publishedAt:publishedAt,urlToImage:urlToImage, description: description, content: content,),));
                          },
                          child: Container(
                            height: 150,
                            width: 300,
                            decoration: BoxDecoration(color: Colors.cyan,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                "${snapshot.data['articles'][i]['title']}",
                                style: const TextStyle(
                                  fontSize: 20, color: Colors.white,),
                                textAlign: TextAlign.center,),
                            ),
                          ),
                        ),
                      );
                    }
                );
              }
            }
            return const Center(child: CircularProgressIndicator(),);
          },
        )
    );
  }
}