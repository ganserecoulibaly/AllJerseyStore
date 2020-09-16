import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:all_jersey_store/payment/PaypalPayment.dart';
// formulaire de contact + adresse + recap de l'item (prix + article)

class livraison extends StatelessWidget {

  String equipe;
  String origine;
  String url_img;
  String annee;
  String prix;
  String taille;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _nom;
  String _prenom;
  //String _email;
  String _rue;
  int _cp;
  String _ville;
  String _pays;

  livraison(String equipe, String origine,String annee, String prix, String url_img, String taille) {
    this.equipe = equipe;
    this.origine = origine;
    this.annee = annee;
    this.prix = prix;
    this.url_img = url_img;
    this.taille = taille;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          //backgroundColor: Colors.black,
        ),
        body: _buildBody(context),
    );
  }


  Widget _buildBody(BuildContext context) {
    return new SafeArea(
        top: false,
        bottom: false,
        child: new Form(
            key: _formKey,
            autovalidate: true,
            child: new ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: <Widget>[
                ListTile(
                      title: Text(equipe + " " + origine + " | " + "Saison " + annee,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      )),
                    subtitle: Text("Taille "  + " | " + prix + "€"),
                    leading: Image.network(
                            url_img,
                          width: 60,
                          height: 60,
                          fit: BoxFit.contain,
                         ),
                   // onTap: () {},
                ),
                new TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Nom',
                    labelText: 'Nom',
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'le nom est requis';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    _nom = value;
                  },
                ),
                new TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Prénom',
                    labelText: 'Prénom',
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'le prénom est requis';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    _prenom = value;
                  },
                ),
                new TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.location_on),
                    hintText: 'Nom et numéro de la rue',
                    labelText: 'Nom et numéro de la rue',
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'les noms et numéros de la rue sont requises';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    _rue = value;
                  },
                ),
                new TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.location_on),
                    hintText: 'Code postal',
                    labelText: 'Code postal',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ], // Only numb
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'le code postal est requis';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    _cp = int.parse(value);;
                  },
                ),
                new TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.location_on),
                    hintText: 'Ville',
                    labelText: 'Ville',
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'la ville est requise';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    _ville = value;
                  },
                ),
                new TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.location_on),
                    hintText: 'Pays',
                    labelText: 'Pays',
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'le pays est requis';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    _pays = value;
                  },
                ),
                new TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.phone),
                    hintText: 'Entrez un numéro de téléphone',
                    labelText: 'Téléphone',
                  ),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    WhitelistingTextInputFormatter.digitsOnly,
                  ],
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'le téléphone est requis';
                      }
                      return null;
                    }
                ),
               /*
                new TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.email),
                    hintText: 'Entrez une adresse mail',
                    labelText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (String value) {
                    if (!RegExp(
                        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                        .hasMatch(value)) {
                      return 'Email non valide';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    _email = value;
                  },
                ),*/
                new Container(
                    padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                    child: new RaisedButton(
                      child: const Text('Aller vers le paiement'),
                      onPressed: () {
                        print('soumission du formulaire');
                        if (_formKey.currentState.validate()) {
                          //onSaved is called!
                          _formKey.currentState.save();
                          print("NOM " + _nom);
                          print("PRENOM " + _prenom);
                          print("nom et numéro de la rue " +_rue);
                          print("CP " + _cp.toString());
                          print("Ville " +_ville);
                          print("Pays " +_pays);
                          //print("mail" +_email);
                          // go to payment page
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => PaypalPayment(
                                onFinish: (number) async {
                                  // payment done
                                  print('order id: '+number);
                                  //send sms
                                },
                              ),
                            ),
                          );
                          return;
                        }
                      }
            )
        )
    ]
    )
    )
    );


  }




}