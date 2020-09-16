import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:all_jersey_store/bodyItem.dart';

class ListLigue1 {
  String equipe;
  String origine;
  String url_img;
  String annee;
  String prix;

  ListLigue1({this.equipe,
    this.origine,
    this.url_img,
    this.annee,
    this.prix});

  factory ListLigue1.fromJson(Map<String, dynamic> json) {
    return ListLigue1(
      equipe: json['equipe'],
      origine: json['origine'],
      url_img: json['url_img'],
      annee: json['annee'],
      prix: json['prix'],
    );
  }
}

class ListLigue1View extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ListLigue1>>(
      future: _fetchJobs(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ListLigue1> data = snapshot.data;
          return _jobsListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  Future<List<ListLigue1>> _fetchJobs() async {

    final jobsListAPIUrl = 'http://www.gansere.com/ajs/select_fr.php';
    final response = await http.get(jobsListAPIUrl);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => new ListLigue1.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  ListView _jobsListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tile(context,data[index].url_img,data[index].equipe, data[index].origine, data[index].annee, data[index].prix);
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
          new BodyItem(url_img: url_img,equipe: equipe,origine: origine, annee: annee, prix: prix,)
      ));
    }
    ,
  );
}