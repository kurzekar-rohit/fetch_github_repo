import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailPage extends StatefulWidget {
  final String fullname;
  DetailPage({Key key, @required this.fullname}) : super(key: key);
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  void initState() {
    super.initState();
    this.getDetailData();
  }

  var ownername, detailData;
  bool isLoading = true;
  final String url = "https://api.github.com/repos/";
  Future getDetailData() async {
    setState(() {
      ownername = widget.fullname;
    });
    var response = await http.get(Uri.encodeFull(url + '$ownername'),
        headers: {"Accept": "application/json"});
    // print(response.body);
    var data = jsonDecode(response.body);
    print("THIS IS DETAIL DATA: $data");
    setState(() {
      detailData = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Colors.transparent)],
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: Container(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                ClipRRect(
                                  child: CachedNetworkImage(
                                    imageUrl: detailData['owner']['avatar_url'],
                                    width: 150,
                                    height: 150,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                Text(
                                  "Owner name: ${detailData['owner']['login']}",
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      height: 1.5,
                                      letterSpacing: 0.5),
                                ),
                                Text(
                                  "Repo name: ${detailData['name']}",
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      height: 1.5,
                                      letterSpacing: 0.5),
                                ),
                                Text(
                                  "Forks count: ${detailData['forks_count']}",
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      height: 1.5,
                                      letterSpacing: 0.5),
                                ),
                                Text(
                                  "Stargazers count: ${detailData['stargazers_count']}",
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      height: 1.5,
                                      letterSpacing: 0.5),
                                ),
                                Text(
                                  "Watchers count: ${detailData['watchers_count']}",
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      height: 1.5,
                                      letterSpacing: 0.5),
                                ),
                                Text(
                                  "Size: ${detailData['size']}",
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      height: 1.5,
                                      letterSpacing: 0.5),
                                ),
                                Text(
                                  "Open issues count: ${detailData['open_issues_count']}",
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      height: 1.5,
                                      letterSpacing: 0.5),
                                ),
                                Text(
                                  "Description: ${detailData['description']}",
                                  maxLines: 5,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      height: 1.5,
                                      letterSpacing: 0.5),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
    );
  }
}
