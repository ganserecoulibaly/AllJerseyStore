import 'package:flutter/material.dart';
import 'package:all_jersey_store/home.dart';
import 'package:all_jersey_store/body.dart';
import 'ListInternational.dart';


class international extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: buildAppBar(context,"Sélections"),
        body: ListInternationalView(),
    );
  }
}