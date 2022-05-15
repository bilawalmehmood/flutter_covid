import 'package:flutter/material.dart';
import 'package:flutter_covid/views/countries_list.dart';
import 'package:flutter_covid/views/detail_country.dart';

import 'views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      title: "Flutter COVID-19",
      home: DetailCountry(
          image: "https://disease.sh/assets/img/flags/pk.png",
          name: "Country",
          casses: 1,
          recovered: 2,
          deth: 2,
          active: 3,
          critical: 4),
    );
  }
}
