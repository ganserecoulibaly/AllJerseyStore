import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'ligue1.dart';
import 'package:all_jersey_store/bodyItem.dart';

class Listinternational {
  String equipe;
  String origine;
  String url_img;
  String annee;
  String prix;

  Listinternational({this.equipe,
    this.origine,
    this.url_img,
    this.annee,});

  factory Listinternational.fromJson(Map<String, dynamic> json) {
    return Listinternational(
      equipe: json['equipe'],
      origine: json['origine'],
      url_img: json['url_img'],
      annee: json['annee'],
    );
  }
}

class ListInternationalView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Listinternational>>(
      future: _fetchJobs(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Listinternational> data = snapshot.data;
          return _jobsListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  Future<List<Listinternational>> _fetchJobs() async {

    final jobsListAPIUrl = 'http://www.gansere.com/ajs/select_int.php';
    final response = await http.get(jobsListAPIUrl);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => new Listinternational.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  ListView _jobsListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tile(context,data[index].url_img,data[index].equipe, data[index].origine, data[index].annee);
        });
  }

  ListTile _tile(context,String url_img,String equipe,String origine,String annee) => ListTile(
    title: Text(equipe,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        )),
    subtitle: Text(origine),
    leading: Image.network(
      url_img,
      //width: double.infinity,
      width: 60,
      height: 60,
      fit: BoxFit.contain,
    ),
    onTap: () {
      Navigator.push(context, new MaterialPageRoute(
          builder: (context) =>
          new BodyItem(url_img: url_img,equipe: equipe,origine: origine,annee: annee),
      ));
    }
    ,
  );
}