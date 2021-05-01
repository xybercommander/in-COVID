import 'package:flutter/material.dart';
import 'package:in_covid/screens/how_to_use_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, Function tapHandler) {
    return Container(
      margin: EdgeInsets.only(bottom: 40, left: 12),
      child: ListTile(
        // leading:
        title: Text(
          title,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 24,
          ),
        ),
        onTap: () {
          tapHandler();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildListTile("OUR AIM", () {
            // Navigator.of(context).pushNamed(HowToUse.routeName);
          }),
          buildListTile("COMPLAINTS", () {
            // Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
          buildListTile("DISCLAIMER", () {
            // Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
          buildListTile("OUR TEAM", () {
            // Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
          buildListTile("HOW TO USE?", () {
            Navigator.of(context).pushNamed(HowToUse.routeName);
          }),
        ],
      ),
    );
  }
}
