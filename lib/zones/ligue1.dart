import 'package:flutter/material.dart';
import 'package:all_jersey_store/home.dart';
import 'ListLigue1.dart';

class ligue1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: buildAppBar(context,"Ligue 1"),
      body: ListLigue1View(),
    );
  }
}