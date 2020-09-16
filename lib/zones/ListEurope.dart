import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'ligue1.dart';

class ListEurope {
  String equipe;
  String origine;
  String url_img;
  String annee;
  String prix;

  ListEurope({this.equipe,
    this.origine,
    this.url_img,
    this.annee,
    this.prix});

  factory ListEurope.fromJson(Map<String, dynamic> json) {
    return ListEurope(
      equipe: json['equipe'],
      origine: json['origine'],
      url_img: json['url_img'],
      annee: json['annee'],
      prix: json['prix'],
    );
  }
}

class ListEuropeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ListEurope>>(
      future: _fetchJobs(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ListEurope> data = snapshot.data;
          return _jobsListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  Future<List<ListEurope>> _fetchJobs() async {

    final jobsListAPIUrl = 'http://www.gansere.com/ajs/select_int.php';
    final response = await http.get(jobsListAPIUrl);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => new ListEurope.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  ListView _jobsListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tile(context,data[index].url_img,data[index].equipe, data[index].origine, data[index].annee,data[index].prix);
        });
  }

  ListTile _tile(context,String url_img,String equipe,String origine, String annee, String prix) => ListTile(
    title: Text(equipe,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        )),
    subtitle: Text(origine + " / " + "Saison " + annee + " | " + prix + "€"),
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
          new ligue1()
      ));
    }
    ,
  );
}