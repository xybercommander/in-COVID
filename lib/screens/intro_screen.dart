import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:in_covid/screens/home_screen.dart';

import 'package:in_covid/screens/service_providers_screen.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List data;
  List imageLink;
  bool gotImage = false;
  Image img;
  Image imgLogo;

  Future<String> getDataData() async {
    var url =
        "https://script.google.com/macros/s/AKfycbyXsnE2_K1XxkE3uMoHuDQeflcE9PcLR44c28mTcZ43rKd_DvAk3gbfgPY5m7xfx6EXXA/exec";
    http.Response response1 =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
    data = json.decode(response1.body);
  }

  Future<String> getImgData() async {
    http.Response response2 = await http.get(
        Uri.parse(
            "https://script.google.com/macros/s/AKfycbxBFn_AIgRnUi4u4ipQno-jBwOmXh4ESGwKkM0yMBpbJRqKOijXIYn5avDbu_O-H8ir7g/exec"),
        headers: {"Accept": "application/json"});
    imageLink = json.decode(response2.body);
    gotImage = true;
  }

  void initFunctions() async {
    imgLogo = await Image.asset("assets/images/logo.png");
    getDataData();
  }

  @override
  void initState() {
    initFunctions();
    getImgData();
    // imgLogo = Image.asset("assets/images/logo.png");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    precacheImage(AssetImage("assets/images/logo.png"), context);
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("assets/images/logo.png"), context);

    Future.delayed(const Duration(seconds: 5), () {
      img = Image(
          image: CachedNetworkImageProvider(imageLink[0]
              ["graph"])); ///////////////////////VVVVVVVV IMPORTANT~~
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName,
          arguments: {"data": data, "img": img});
    });

    return Container(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false,
          ),
          backgroundColor: Colors.white,
          body: Center(
            child: Container(
              child: Image.asset("assets/images/logo.png"),
              height: 270,
            ),
          )
          //Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          //   Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          //     Container(
          //       height: 50,
          //       child: Image.asset("assets/images/logo.png"),
          //       // child: Text(
          //       //   "in-COVID.",
          //       //   style: TextStyle(
          //       //       fontFamily: "Montserrat",
          //       //       fontWeight: FontWeight.bold,
          //       //       fontSize: 50),
          //       // ),
          //     )
          //   ]),
          //   // Row(
          //   //   mainAxisAlignment: MainAxisAlignment.center,
          //   //   children: [
          //   //     Text(
          //   //       "TEAM ACCESS.",
          //   //       style: TextStyle(fontFamily: "Montserrat"),
          //   //       textAlign: TextAlign.center,
          //   //     ),
          //   //   ],
          //   // ),
          // ]),
          ),
    );
  }
}
