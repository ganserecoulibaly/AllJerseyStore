import 'package:flutter/material.dart';
import 'models/Product.dart';
import 'package:all_jersey_store/home.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
//import 'package:flutter_sms/flutter_sms.dart';
import 'dart:async';
import 'package:sms/sms.dart';


class BodyItem extends StatefulWidget {

  //final Product product;
  final String url_img;
  final String equipe;
  final String origine;
  final String annee;


  const BodyItem({Key key, this.url_img,this.equipe, this.origine,this.annee}) : super(key: key);

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
                  SizedBox(height: 40),
                  RadioButtonGroup(
                        labels: <String>[
                          "S",
                          "L",
                          "M",
                          "XL",
                        ],
                        orientation: GroupedButtonsOrientation.HORIZONTAL,
                        padding: EdgeInsets.only(left: 90.0),
                        onSelected: (String selected) => print(selected)
                    ),
                  SizedBox(height: 40),
                  Text(
                    "20 euros",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 40),
                  FloatingActionButton(onPressed:  () {
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
