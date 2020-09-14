import 'package:flutter/material.dart';
import 'package:all_jersey_store/home.dart';
import 'ListItaly.dart';


class italy extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: buildAppBar(context,"Serie A"),
        body: ListSerieAView(),
    );
  }
}