import 'package:flutter/material.dart';
import 'package:in_covid/widgets/main_drawer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

class ServiceProviderDetails extends StatelessWidget {
  static const routeName = "/services-provider-details";

  void customLaunch(command) async {
    await launch(command);
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final name = routeArgs["name"];
    final address = routeArgs["address"];
    final phone = routeArgs["phone"];
    final service = routeArgs["service"];
    final district = routeArgs["district"];
    final date = routeArgs["date"];
    final homeDelivery = routeArgs["homeDelivery"];
    final bloodGroup = routeArgs["bloodGroup"];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text("${service}", style: TextStyle(fontFamily: "Montserrat")),
        ),
        drawer: Drawer(
          child: MainDrawer(),
        ),
        body: Container(
          margin: EdgeInsets.all(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(248, 156, 156, 1),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    border: Border.all(
                        color: Color.fromRGBO(255, 130, 130, 1), width: 4)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        child: Text(
                      "${service} SERVICE",
                      style: TextStyle(fontFamily: "Montserrat", fontSize: 25),
                      textAlign: TextAlign.left,
                    )),
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: Text(
                        "${district}",
                        style: TextStyle(fontFamily: "Montserrat"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: Divider(
                        color: Colors.black,
                        thickness: 2,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "NAME: ${name}",
                        style:
                            TextStyle(fontFamily: "Montserrat", fontSize: 16),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "PHONE: ${phone}",
                        style:
                            TextStyle(fontFamily: "Montserrat", fontSize: 16),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "POSTED ON: ${date}",
                        style:
                            TextStyle(fontFamily: "Montserrat", fontSize: 16),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: homeDelivery.length != 0
                          ? Text(
                              "HOME DELIVERY: ${homeDelivery}",
                              style: TextStyle(
                                  fontFamily: "Montserrat", fontSize: 16),
                            )
                          : Text(
                              "HOME DELIVERY DETAILS NOT AVAILABLE.",
                              style: TextStyle(fontFamily: "Montserrat"),
                            ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: bloodGroup.length != 0
                          ? Text(
                              "BLOOD GROUP: ${bloodGroup}",
                              style: TextStyle(
                                  fontFamily: "Montserrat", fontSize: 16),
                            )
                          : Text(
                              "BLOOD GROUP NOT AVAILABLE.",
                              style: TextStyle(fontFamily: "Montserrat"),
                            ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 40),
                  child: IconButton(
                    icon: Icon(Icons.phone),
                    onPressed: () => {customLaunch('tel:${phone}')},
                    iconSize: 50,
                  )),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  "CLICK HERE TO REPORT DISCREPANCIES",
                  style: TextStyle(fontFamily: "Montserrat", fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ));
  }
}
