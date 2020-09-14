import 'package:flutter/material.dart';

class Product {

  /**
   * equipe: nom de l'equipe
   * origine: domicile, exterieur ou troisième(home/away/third)
   * name: nom au dos du maillot
   * number: numéro au dos du maillot
   * url_maillot : url de l'image du maillot
   * size_maillot: taille du maillot
   *
   * Autres potentiels attributs:
   *
   **/

  String equipe;
  String origine;
  String name;
  int number;
  String url_maillot;
  String size_maillot;

  Product({
    this.equipe,
    this.origine,
    this.name,
    this.number,
    this.url_maillot,
    this.size_maillot
  });

}

List<Product> products = [
  Product(
      //id: 1,
      equipe: "paris",
      origine: "home",
      name: "neymar",
      number: 10
      ),
  Product(
      //id: 2,
      equipe: "paris",
      origine: "away",
      name: "mbappe",
      number: 7,
  ),
];

