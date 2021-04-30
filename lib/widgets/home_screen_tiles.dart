import 'package:flutter/material.dart';
import 'package:in_covid/screens/services_screen.dart';

class HomeScreenTiles extends StatelessWidget {
  final String city;
  final String cityImg;
  final String cityUrl;
  final String imageUrl;

  HomeScreenTiles(this.city, this.cityImg, this.cityUrl, this.imageUrl);

  void nextScreen(BuildContext context) {
    Navigator.of(context).pushNamed(ServicesScreen.routeName,
        arguments: {"state": city, "stateUrl": cityUrl, "imageUrl": imageUrl});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => nextScreen(context),
      splashColor: Color.fromRGBO(255, 130, 130, 1),
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(15), topLeft: Radius.circular(15)),
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          children: [
            ClipRRect(
              child: Image.network(
                cityImg,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 1),
            Container(
              padding: EdgeInsets.only(top: 5),
              child: FittedBox(
                child: Text(
                  city,
                  style: TextStyle(
                    fontFamily: "Montserrat",
                  ),
                  textAlign: TextAlign.center,
                ),
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
