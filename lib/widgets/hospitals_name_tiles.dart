import 'package:flutter/material.dart';

class HospitalsNameTiles extends StatelessWidget {
  final String district;
  final String name;
  final int beds;
  final String phone;
  final String address;

  HospitalsNameTiles(
      {this.district, this.name, this.beds, this.phone, this.address});

  @override
  Widget build(BuildContext context) {
    var colors;
    if (beds >= 50) {
      colors = Colors.green;
    } else if (beds >= 20) {
      colors = Colors.yellow[600];
    } else {
      colors = Colors.red;
    }
    return InkWell(
      child: Container(
        padding: EdgeInsets.only(left: 20),
        margin: EdgeInsets.only(bottom: 25),
        decoration: BoxDecoration(
          color: Color.fromRGBO(248, 156, 156, 1),
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: Color.fromRGBO(255, 130, 130, 1), width: 3),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 200,
                    child: Flexible(
                      child: Text(
                        name,
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 5),
                    child: Text(
                      district,
                      style: TextStyle(fontFamily: "Montserrat"),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 120,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                border: Border.all(
                    color: Color.fromRGBO(255, 130, 130, 1), width: 3),
              ),
              child: Expanded(
                child: Text(
                  beds.toString(),
                  style: TextStyle(
                      fontFamily: "Montserrat", fontSize: 50, color: colors),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
