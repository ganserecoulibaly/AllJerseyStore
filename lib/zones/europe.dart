import 'package:flutter/material.dart';
import 'package:all_jersey_store/home.dart';
import 'ListEurope.dart';


class europe extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: buildAppBar(context,"Autres championnats"),
        body: ListEuropeView(),
    );
  }
}