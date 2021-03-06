import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:in_covid/models/safety_quotes.dart';
import 'package:in_covid/screens/home_screen.dart';

import 'package:in_covid/screens/service_providers_screen.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = "/splash-screen";

  List data;

  Future<String> getData(String stateName, String serviceName) async {
    var url =
        "https://stark-crag-58005.herokuapp.com/${stateName}/${serviceName}";
    http.Response response =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});

    data = json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final stateName = routeArgs["state"];
    final serviceName = routeArgs["service"];

    String urlStateName = "${stateName.replaceAll(" ", "")}";
    String urlServiceName = "${serviceName.replaceAll(" ", "%20")}";

    getData(urlStateName, urlServiceName);

    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed(
          ServiceProvidersScreen.routeName,
          arguments: {"data": data, "serviceName": serviceName});
    });

    var random = new Random();
    var n = random.nextInt(QUOTES.length);

    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        backgroundColor: Colors.white,
        body: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  // padding: EdgeInsets.only(bottom: 20),
                  child: Flexible(
                    child: Text(
                      QUOTES[n],
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}
