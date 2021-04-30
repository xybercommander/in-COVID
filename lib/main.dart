import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:in_covid/screens/hospitals_screen.dart';
import 'package:in_covid/screens/intro_screen.dart';
import 'package:in_covid/screens/service_providers_screen.dart';
import 'package:in_covid/screens/services_screen.dart';
import 'package:in_covid/screens/splash_screen.dart';
import './screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'in-COVID',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: IntroScreen(),
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        ServicesScreen.routeName: (ctx) => ServicesScreen(),
        ServiceProvidersScreen.routeName: (ctx) => ServiceProvidersScreen(),
        HospitalsScreen.routeName: (ctx) => HospitalsScreen(),
        SplashScreen.routeName: (ctx) => SplashScreen(),
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(),),
//     );
//   }
// }
