import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:in_covid/screens/hospitals_screen.dart';
import 'package:in_covid/screens/service_providers_screen.dart';
import 'package:in_covid/screens/services_screen.dart';
import 'package:in_covid/screens/splash_screen.dart';

class ServicesScreenTiles extends StatefulWidget {
  final String state;
  final String service;
  final String stateUrl;

  ServicesScreenTiles(this.service, this.state, this.stateUrl);

  @override
  _ServicesScreenTilesState createState() => _ServicesScreenTilesState();
}

class _ServicesScreenTilesState extends State<ServicesScreenTiles> {
  List hospitals;

  Future<String> getHospitalsData() async {
    http.Response response = await http.get(Uri.parse(widget.stateUrl),
        headers: {"Accept": "application/json"});

    this.setState(() {
      hospitals = json.decode(response.body);
    });
  }

  void nextScreen(BuildContext context) {
    Navigator.of(context).pushNamed(SplashScreen.routeName,
        arguments: {"state": widget.state, "service": widget.service});
  }

  void hospitalScreen(BuildContext context) {
    // Navigator.of(context).pushNamed(HospitalsScreen.routeName,
    //     arguments: {"state": widget.state, "StateHospitals": hospitals});
  }

  void initState() {
    super.initState();
    getHospitalsData();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        widget.service == "HOSPITALS"
            ? hospitalScreen(context)
            : nextScreen(context)
      },
      splashColor: Color.fromRGBO(255, 130, 130, 1),
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(15), topLeft: Radius.circular(15)),
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(
              height: 22,
            ),
            FittedBox(
              child: Text(
                widget.service,
                style: TextStyle(
                  fontFamily: "Montserrat",
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Color.fromRGBO(248, 156, 156, 1),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
          border: Border.all(color: Color.fromRGBO(255, 130, 130, 1)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }
}
