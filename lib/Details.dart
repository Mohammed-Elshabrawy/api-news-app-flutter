import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'new.dart';

class Details extends StatelessWidget {
  var  author;
  var title;
  var url;
  var publishedAt;
  var urlToImage;
  Details(
      {required this.author,
      required this.title,
      required this.url,
      required this.publishedAt,
      required this.urlToImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(children: [
                IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(context as BuildContext,
                          MaterialPageRoute(builder: (context) => MyAApp()));
                    },
                    icon: Icon(Icons.arrow_back_ios_new_sharp)),
                Text(
                  " تفاصيل ",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                )
              ]),
              Center(
                child: Container(
                    height: 680,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(20)),
                    child: urlToImage == null
                        ?  Padding(
                          padding: const EdgeInsets.fromLTRB(5, 200, 5, 0),
                          child: Column(
                                children: [
                                  Text(
                                    "  المصدر : $author",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "  العنوان : $title",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "no Picture",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "Date : $publishedAt",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                        )

                        : Padding(
                          padding: const EdgeInsets.fromLTRB(5, 100, 5, 0),
                          child: Column(
                                children: [
                                  Text(
                                    "  المصدر : $author",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "  العنوان : $title",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 200,
                                    width: 200,
                                    child: Image.network(urlToImage),
                                  ),
                                  Text(
                                    "Date : $publishedAt",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                        ),
                ),
              ),
            ],
          ),
        ));
  }
}
