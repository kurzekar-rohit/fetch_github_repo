import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:github_api_unite_cloud/Model/RepositryData.dart';
import 'package:github_api_unite_cloud/Screens/DetailPage.dart';

import '../Services/Services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<RepositoryData> _repositorydata;
  bool isLoading = true;

  void initState() {
    super.initState();
    Services.getUsers().then((repositorydata) {
      setState(() {
        _repositorydata = repositorydata;

        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: ListView.builder(
                itemCount: _repositorydata.length,
                itemBuilder: (context, index) {
                  return Padding(
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
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailPage(
                                              fullname: _repositorydata[index]
                                                  .fullName,
                                            )));
                              },
                              child: Container(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        ClipRRect(
                                          child: CachedNetworkImage(
                                            imageUrl: _repositorydata[index]
                                                .owner
                                                .avatarUrl,
                                            width: width / 5.5,
                                            height: width / 6,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(left: 16),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  "Owner name: ${_repositorydata[index].owner.login}",
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black,
                                                      height: 1.5,
                                                      letterSpacing: 0.5),
                                                ),
                                                Text(
                                                  "Repo name: ${_repositorydata[index].name}",
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black,
                                                      height: 1.5,
                                                      letterSpacing: 0.5),
                                                ),
                                                Text(
                                                  "Description: ${_repositorydata[index].description}",
                                                  // textAlign: TextAlign.center,
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black,
                                                      height: 1.5,
                                                      letterSpacing: 0.5),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ));
                },
              ),
            ),
    );
  }
}
