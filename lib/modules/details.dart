import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';
import '../layout/home_layout.dart';

class Details extends StatelessWidget {
  final String author;
  final String title;
  final String description;
  final String url;
  final String publishedAt;
  final String urlToImage;
  final String content;
  const Details(
      {super.key,
      required this.author,
      required this.title,
      required this.url,
      required this.publishedAt,
      required this.urlToImage,
      required this.description,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Center(
            child: Text(
              "Details",
              style: TextStyle(fontSize: 20,),
            ),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              icon: const Icon(Icons.arrow_back_ios_outlined)),
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Center(
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "$title ",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          urlToImage == "none"
                              ? const SizedBox()
                              : SizedBox(
                                  width: double.infinity,
                                  child: Image.network(urlToImage),
                                ),
                          const SizedBox(
                            height: 10,
                          ),
                          ReadMoreText(
                            description, trimMode: TrimMode.Line,
                            trimLines: 2,
                            colorClickableText: Colors.pink,
                            trimCollapsedText: 'Show more',
                            trimExpandedText: 'Show less',
                            // moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Stack(children: [
                            Text(
                              description,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: TextButton(
                                  style: ButtonStyle(
                                    minimumSize: const WidgetStatePropertyAll(
                                        Size(65, 15)),
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    padding: const WidgetStatePropertyAll(
                                        EdgeInsets.zero),
                                    backgroundColor:
                                        const WidgetStatePropertyAll(
                                            Colors.white),
                                    shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100))),
                                  ),
                                  onPressed: () async {
                                    if (url != "none") {
                                      launchUrl(Uri.parse(url));
                                    }
                                  },
                                  child: const Text(
                                    "read more..",
                                    style: TextStyle(
                                        color: Colors.red, height: 1.5),
                                  )),
                            )
                          ]),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
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
                                  Text(
                                    publishedAt,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ));
  }
}
