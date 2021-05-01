import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:in_covid/screens/service_provider_details.dart';

class ServiceProvidersScreenTiles extends StatelessWidget {
  final String name;
  final String address;
  final String phone;
  final String service;
  final String district;
  final String date;
  final String homeDelivery;
  final String bloodGroup;
  final String dateOfRecovery;

  ServiceProvidersScreenTiles(
      {this.name,
      this.address,
      this.phone,
      this.service,
      this.district,
      this.date,
      this.homeDelivery,
      this.bloodGroup,
      this.dateOfRecovery});

  void goToNext(BuildContext context) {
    Navigator.of(context)
        .pushNamed(ServiceProviderDetails.routeName, arguments: {
      "name": name,
      "address": address,
      "phone": phone,
      "service": service,
      "district": district,
      "date": date,
      "homeDelivery": homeDelivery,
      "bloodGroup": bloodGroup,
      "dateOfRecovery": dateOfRecovery
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        goToNext(context);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 25),
        child: Row(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 130, 130, 1),
                borderRadius: BorderRadius.all(Radius.circular(15)),
                border: Border.all(
                    color: Color.fromRGBO(255, 130, 130, 1), width: 2),
              ),
              child: Image.asset(
                "assets/images/${service}.png",
                color: Colors.white,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 150,
                      child: Flexible(
                        child: Text(
                          name,
                          style: TextStyle(
                            fontFamily: "Montserrat",
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        district,
                        style: TextStyle(
                          fontFamily: "Montserrat",
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Color.fromRGBO(248, 156, 156, 1),
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: Color.fromRGBO(248, 156, 156, 1), width: 2),
        ),
      ),
    );
  }
}
