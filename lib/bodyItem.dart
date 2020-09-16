import 'package:flutter/material.dart';
import 'models/Product.dart';
import 'package:all_jersey_store/home.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
//import 'package:flutter_sms/flutter_sms.dart';
import 'dart:async';
import 'package:sms/sms.dart';
import 'livraison/livraison.dart';


class BodyItem extends StatefulWidget {

  final String url_img;
  final String equipe;
  final String origine;
  final String annee;
  final String prix;
  String taille;


   BodyItem({Key key, this.url_img,this.equipe, this.origine,this.annee, this.prix, this.taille}) : super(key: key);

  @override
  _BodyItemState createState() => _BodyItemState();
}

class _BodyItemState extends State<BodyItem> {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: buildAppBar(context, widget.equipe),
      body: new Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(height: 5.0),
                  Text(
                    widget.equipe + " " +  widget.origine,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black,
                                     fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Saison " + widget.annee,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 50.0),
                  Image.network( widget.url_img),
                  SizedBox(height: 20),
                  Text("Taille"),
                  DropdownButton<String>(
                    items: [
                      DropdownMenuItem<String>(
                        child: Text('S'),
                        value: 'S',
                      ),
                      DropdownMenuItem<String>(
                        child: Text('M'),
                        value: 'M',
                      ),
                      DropdownMenuItem<String>(
                        child: Text('L'),
                        value: 'L',
                      ),
                      DropdownMenuItem<String>(
                        child: Text('XL'),
                        value: 'XL',
                      ),
                    ],
                    onChanged: (String value) {
                      setState(() {
                        print("TAILLE CHOISI : " + value);
                        widget.taille = value;
                      });
                    },
                    hint: Text('Select Item'),
                    value: widget.taille,
                  ),
                  SizedBox(height: 30),
                  Text(
                    widget.prix + "€",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 40),
                  FloatingActionButton(onPressed:  () {
                    Navigator.push(context, new MaterialPageRoute(
                        builder: (context) =>
                        new livraison(widget.equipe, widget.origine, widget.annee, widget.prix, widget.url_img, widget.taille)

                    ));
                      //_sendSMS("bonjour test sms", "0033695458762");
                      //go to informations livraisons and payment screen
                   },
                                       elevation: 0,
                                       backgroundColor: Colors.black,
                                       child: new Icon(Icons.shopping_cart),
                  ),
                ],
              ),
            ],
          ),
      )
    );
  }


  void _sendSMS(String texte, String address) async {
    SmsSender sender = new SmsSender();
    //String address = "1234567";

    SmsMessage message = new SmsMessage(address, texte);
    message.onStateChanged.listen((state) {
      if (state == SmsMessageState.Sent) {
        print("SMS is sent!");
      } else if (state == SmsMessageState.Delivered) {
        print("SMS is delivered!");
      }
    });
    sender.sendSms(message);
  }

}
