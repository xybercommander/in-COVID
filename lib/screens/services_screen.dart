import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:in_covid/models/services.dart';
import 'package:in_covid/widgets/main_drawer.dart';
import 'package:in_covid/widgets/services_screen_tiles.dart';

import '../widgets/home_screen_tiles.dart';

class ServicesScreen extends StatefulWidget {
  static const routeName = "/services-screen";

  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  // @override
  // void initState() {
  //   getData();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final stateName = routeArgs["state"];
    final stateUrl = routeArgs["stateUrl"];
    final Image graph = routeArgs["image"];
    final List data = routeArgs["data"];

    // print(stateUrl);
    return stateUrl != ""
        ? //if(!data.isEmpty){
        Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title:
                  Text(stateName, style: TextStyle(fontFamily: "Montserrat")),
            ),
            drawer: Drawer(
              child: MainDrawer(),
            ),
            body: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      // color: Colors.grey.shade500,
                      borderRadius: BorderRadius.circular(15)),
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: ClipRRect(
                    child: Container(
                      child: graph,
                      height: 180,
                      width: double.infinity,
                      // fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "PLEASE SELECT YOUR SERVICE: ",
                    style: TextStyle(fontFamily: "Montserrat", fontSize: 20),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    itemBuilder: (BuildContext ctx, index) {
                      return ServicesScreenTiles(
                          data[index]["service"], stateName, stateUrl);
                    },
                    padding: EdgeInsets.all(25),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: data.length,
                  ),
                ),
              ],
            ),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: Center(
              child: Container(
                child: Text(
                  "DATA NOT FOUND FOR THIS STATE.",
                  style: TextStyle(fontFamily: "Montserrat", fontSize: 30),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
  }
}
