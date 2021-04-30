import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:in_covid/models/city_names.dart';

import '../widgets/home_screen_tiles.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Image img;

  // @override
  void initState() {
    setState(() {});
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   precacheImage(img.image, context);
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    final bulkData =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final Image img = bulkData["img"];
    final List data = bulkData["data"];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "HOME",
          style: TextStyle(fontFamily: "Montserrat"),
        ),
      ),
      drawer: Drawer(),
      body: Column(children: [
        Container(
          decoration: BoxDecoration(
              // color: Colors.grey.shade500,
              borderRadius: BorderRadius.circular(15)),
          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: ClipRRect(
            child: Container(
              child: img,
              height: 180,
              width: double.infinity,
              // fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 20),
          child: Text(
            "PLEASE SELECT YOUR STATE: ",
            style: TextStyle(fontFamily: "Montserrat", fontSize: 20),
          ),
        ),
        Expanded(
          child: GridView.builder(
            itemBuilder: (BuildContext ctx, index) {
              return (HomeScreenTiles(
                  data[index]["State"],
                  data[index]["State Image"],
                  data[index]["State API"],
                  data[index]["State Graph"]));
            },
            padding: EdgeInsets.all(25),
            // children: STATES
            //     .map((city) => HomeScreenTiles(city["Name"], city["Url"]))
            //     .toList(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: data.length,
          ),
        ),
      ]),
    );
  }
}
