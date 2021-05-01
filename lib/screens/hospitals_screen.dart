import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:in_covid/widgets/hospitals_name_tiles.dart';

class HospitalsScreen extends StatefulWidget {
  static const routeName = "/hospitals";

  @override
  _HospitalsScreenState createState() => _HospitalsScreenState();
}

class _HospitalsScreenState extends State<HospitalsScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final state = routeArgs["state"];
    final List hospitals = routeArgs["StateHospitals"];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "HOSPITALS",
          style: TextStyle(fontFamily: "Montserrat"),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      drawer: Drawer(),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Text(
              "CLICK HERE TO REPORT DISCREPANCIES",
              style: TextStyle(
                fontFamily: "Montserrat",
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 50, left: 50, right: 50),
              child: hospitals.length != null
                  ? ListView(
                      children: hospitals.map(
                        (e) {
                          return HospitalsNameTiles(
                            name: e["Name"],
                            district: e["District"],
                            beds: e["Vacant"],
                            address: e["Address"],
                            phone: e["Phone Number"],
                          );
                        },
                      ).toList(),
                    )
                  : Container(
                      child: Text(
                        "SORRY, NO HOSPITAL DATA AVAILABLE IN YOUR STATE.",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
