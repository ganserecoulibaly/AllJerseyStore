import 'package:flutter/material.dart';
import 'package:all_jersey_store/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'All Jersey Store',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Color(0xFF535353)),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

