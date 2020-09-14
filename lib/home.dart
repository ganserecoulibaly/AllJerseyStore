import 'package:flutter/material.dart';
import 'package:all_jersey_store/zones/liga.dart';
import 'package:all_jersey_store/zones/ligue1.dart';
import 'package:all_jersey_store/zones/italy.dart';
import 'package:all_jersey_store/zones/england.dart';
import 'package:all_jersey_store/zones/europe.dart';
import 'package:all_jersey_store/zones/germany.dart';
import 'package:all_jersey_store/zones/international.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';



class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MultiLevelDrawer(
        backgroundColor: Colors.lightBlueAccent,
        rippleColor: Colors.black,
        subMenuBackgroundColor: Colors.grey.shade200,
        header: Container(                  // Header for Drawer
          height: MediaQuery.of(context).size.height * 0.25,
        ),
        children: [           // Child Elements for Each Drawer Item
          MLMenuItem(
              leading: Icon(Icons.sports_soccer),
              trailing: Icon(Icons.arrow_right),
              content: Text(
                "Football",
              ),
              subMenuItems: [
                MLSubmenu(
                    onClick: () {Navigator.push(context, new MaterialPageRoute(
                                  builder: (context) => new ligue1()
                                            ));},
                    submenuContent: Text("Ligue 1")),
                MLSubmenu(
                    onClick: () {Navigator.push(context, new MaterialPageRoute(
                                  builder: (context) =>
                                  new liga()
                                            ));},
                    submenuContent: Text("Liga")),
                MLSubmenu(
                    onClick: () {Navigator.push(context, new MaterialPageRoute(
                                builder: (context) =>
                                new bundesliga()
                            ));},
                    submenuContent: Text("Bundesliga")),
                MLSubmenu(
                    onClick: () {Navigator.push(context, new MaterialPageRoute(
                                builder: (context) =>
                                new premierLeague()
                            ));},
                    submenuContent: Text("Premier League")),
                MLSubmenu(
                    onClick: () {Navigator.push(context, new MaterialPageRoute(
                              builder: (context) =>
                              new italy()
                          ));},
                    submenuContent: Text("Serie A")),
                MLSubmenu(
                              onClick: () {Navigator.push(context, new MaterialPageRoute(
                              builder: (context) =>
                              new international()
                          ));},
                    submenuContent: Text("International")),
              ],
             ),
          MLMenuItem(
              leading: Icon(Icons.sports_basketball),
              trailing: Icon(Icons.arrow_right),
              content: Text("NBA"),
              onClick: () {},
              subMenuItems: [
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 1")),
                //MLSubmenu(onClick: () {}, submenuContent: Text("Option 2"))
              ]),
        /*  MLMenuItem(
            leading: Icon(Icons.notifications),
            content: Text("Notifications"),
            onClick: () {},
          ), */
         /*
          MLMenuItem(
              leading: Icon(Icons.payment),
              trailing: Icon(Icons.arrow_right),
              content: Text(
                "Payments",
              ),
              subMenuItems: [
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 1")),
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 2")),
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 3")),
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 4")),
              ],
              onClick: () {}), */
        ],
      ),
      appBar: buildAppBar(context,"All Jersey Store"),
      //body: Container(),
    );
  }
}

/*
      surement des textes avec explication
      => cliquer sur le drapeau pour accéder au différents championnats
      => etc
       */


//return App Bar for Home Page
AppBar buildAppBar(context, String title) {
  return AppBar(
    title: Text(title),
    //backgroundColor: Colors.white,
    elevation: 0,
    actions: <Widget>[
      IconButton(
        //ligue 1
        icon: new Image.asset('assets/icons/france.png'),
        onPressed: () {
          Navigator.push(context, new MaterialPageRoute(
              builder: (context) =>
              new ligue1()
          ));
        },
      ),
      IconButton(
        //liga
        icon: new Image.asset('assets/icons/spain.png'),
        onPressed: () {
          Navigator.push(context, new MaterialPageRoute(
              builder: (context) =>
              new liga()
          ));
        },
      ),
      IconButton(
        //bundesliga
        icon: new Image.asset('assets/icons/germany.png'),
        onPressed: () {
          Navigator.push(context, new MaterialPageRoute(
              builder: (context) =>
              new bundesliga()
          ));
        },
      ),
      IconButton(
        //premier league
        icon: new Image.asset('assets/icons/england.png'),
        onPressed: () {
          Navigator.push(context, new MaterialPageRoute(
              builder: (context) =>
              new premierLeague()
          ));
        },
      ),
      IconButton(
        //serie A
        icon: new Image.asset('assets/icons/italy.png'),
        onPressed: () {
          Navigator.push(context, new MaterialPageRoute(
              builder: (context) =>
              new italy()
          ));
        },
      ),
   /*
      IconButton(
        //Autres championnats
        icon: new Image.asset('assets/icons/europe.png'),
        onPressed: () {
          Navigator.push(context, new MaterialPageRoute(
              builder: (context) =>
              new europe()
          ));
        },
      ),
      */
      IconButton(
        //International
        icon: new Image.asset('assets/icons/world.png'),
        onPressed: () {
          Navigator.push(context, new MaterialPageRoute(
              builder: (context) =>
              new international()
          ));
        },
      ),
      /*
      IconButton(
        icon: Icon(Icons.shopping_cart),
        color: Color(0xFF535353),
        onPressed: () {},
      ),*/
    ],
  );
}

