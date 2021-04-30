import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:in_covid/widgets/service_providers_screen_tiles.dart';

class ServiceProvidersScreen extends StatefulWidget {
  static const routeName = "/service-provider";

  @override
  _ServiceProvidersScreenState createState() => _ServiceProvidersScreenState();
}

class _ServiceProvidersScreenState extends State<ServiceProvidersScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final List serviceProviders = routeArgs["data"];
    final serviceName = routeArgs["serviceName"];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          serviceName,
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
              "CLICK HERE TO REGISTER YOUR SERVICE",
              style: TextStyle(
                fontFamily: "Montserrat",
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 50, left: 50, right: 50),
              child: serviceProviders.length != 0
                  ? ListView.builder(
                      itemBuilder: (BuildContext context, index) {
                        return ServiceProvidersScreenTiles(
                          name: serviceProviders[index]["name"],
                          address: serviceProviders[index]["address"],
                          phone: serviceProviders[index]["phone"],
                          service: serviceProviders[index]["service"],
                          district: serviceProviders[index]["district"],
                          date: serviceProviders[index]["date"],
                          homeDelivery: serviceProviders[index]["homeDelivery"],
                          bloodGroup: serviceProviders[index]["bloodGroup"],
                          dateOfRecovery: serviceProviders[index]
                              ["dateOfRecovery"],
                        );
                      },
                      itemCount: serviceProviders.length,
                    )
                  : Container(
                      child: Text(
                        "SORRY, NO ${serviceName} SERVICE AVAILABLE IN YOUR STATE.",
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
