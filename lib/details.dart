import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'new.dart';

class Details extends StatelessWidget {
  final String  author;
  final String title;
  final String url;
  final String publishedAt;
  final String urlToImage;
  const Details(
      {super.key,  required this.author,
       required this.title,
       required this.url,
       required this.publishedAt,
       required this.urlToImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text("Details",style: TextStyle(fontSize: 20,color: Colors.black),),
          leading: IconButton(onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyAApp()));
          }, icon: const Icon(Icons.arrow_back_ios_outlined)),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Center(
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(20)),
                    child:   Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                                children: [
                                  Text(
                                    "$title read more",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.visible,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  urlToImage == "none" ? const SizedBox():SizedBox(
                                    width: double.infinity,
                                    child: Image.network(urlToImage),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 200,
                                        child: Text(
                                          "By $author",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                      TextButton(onPressed: () async{
                                        if(url!="none"){
                                          launchUrl(Uri.parse(url));
                                        }
                                      }, child: const Text("read more..",style: TextStyle(color: Colors.red),))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      const Spacer(),
                                      Text(
                                        publishedAt,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                        )
                ),
              ),
            ],
          ),
        ));
  }
}
