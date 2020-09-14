import 'package:flutter/material.dart';
import 'package:all_jersey_store/home.dart';
import 'ListPL.dart';

class premierLeague extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: buildAppBar(context,"Premier League"),
      body: ListPLView(),
      );
    }
}