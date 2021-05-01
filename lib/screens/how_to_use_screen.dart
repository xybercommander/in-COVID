import 'package:flutter/material.dart';
import 'package:in_covid/models/how_to_use_text.dart';

class HowToUse extends StatelessWidget {
  static const routeName = "/about-us";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "HOW TO USE?",
            style: TextStyle(fontFamily: "Montserrat"),
          ),
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.only(left: 30, right: 30, bottom: 50, top: 50),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                // color: Color.fromRGBO(248, 156, 156, 1),
                borderRadius: BorderRadius.all(Radius.circular(15)),
                border: Border.all(
                    color: Color.fromRGBO(255, 130, 130, 1), width: 4)),
            child: SingleChildScrollView(
              child: Text(
                HOW_TO_USE,
                style: TextStyle(fontFamily: "Montserrat", fontSize: 20),
              ),
            ),
          ),
        ));
  }
}
