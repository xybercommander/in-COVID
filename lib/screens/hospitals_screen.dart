import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

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
    final List hospitals = routeArgs["hospitals"];
    // print(hospitals);

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
      body: Container(
          // child: GridView.builder(gridDelegate: gridDelegate, itemBuilder: itemBuilder),
          ),
    );
  }
}
