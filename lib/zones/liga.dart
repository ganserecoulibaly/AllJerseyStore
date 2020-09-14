import 'package:flutter/material.dart';
import 'package:all_jersey_store/home.dart';
import 'ListLiga.dart';

class liga extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: buildAppBar(context,"Liga"),
     /// grid view
     body: ListLigaView(),//
    );
  }

}

     /*GridView.count(
       primary: false,
       padding: const EdgeInsets.all(20),
       crossAxisSpacing: 10,
       mainAxisSpacing: 10,
       crossAxisCount: 2,
       children: <Widget>[
         _getColumnItem("https://store.fcbarcelona.com/medias/?context=bWFzdGVyfGltYWdlc3wyMjg2ODF8aW1hZ2UvanBlZ3xoNzQvaDdlLzg4NDE2MzM4NTc1NjZ8ZjE5OTAwYTU5YzEzODg3YTQxNWJiNmZhZDJjOGZhMzJjODMxOTNkNmE0MWIwNWU3MDQ2MmM2YTRjZGI1MjlhMg",
           "Barcelone", "Away"),

         _getColumnItem("https://store.fcbarcelona.com/medias/?context=bWFzdGVyfGltYWdlc3wxNjY4ODl8aW1hZ2UvanBlZ3xoYWYvaDM0Lzg4NDY2MzUyMzc0MDZ8MTVhNzYyMmYxYjBkYmMwMGFhZDQzNGVjM2Q0ZjI5MTE1NjA0NjY4OGVlODE4YjcyYjVhMjk5MTllMDU5NGQwYg",
                          "Barcelone", "Away"),
         Container(
           padding: const EdgeInsets.all(8),
           child:  const Text("He'd have you all unravel at the"),
           color: Colors.teal[100],
         ),
         Container(
           padding: const EdgeInsets.all(8),
           child: const Text('Heed not the rabble'),
           color: Colors.teal[200],
         ),
         Container(
           padding: const EdgeInsets.all(8),
           child: const Text('Sound of screams but the'),
           color: Colors.teal[300],
         ),
         Container(
           padding: const EdgeInsets.all(8),
           child: const Text('Who scream'),
           color: Colors.teal[400],
         ),
         Container(
           padding: const EdgeInsets.all(8),
           child: const Text('Revolution is coming...'),
           color: Colors.teal[500],
         ),
         Container(
           padding: const EdgeInsets.all(8),
           child: const Text('Revolution, they...'),
           color: Colors.teal[600],
         ),
       ],
     )
    );
  }
}
*/
/*
Widget _getColumnItem(String url_jersey, String equipe, String origine) {
  return Column(
    //crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Image.network(
        url_jersey,
        //width: double.infinity,
        width: 60,
        height: 60,
        fit: BoxFit.contain,
      ),
      IconButton(
        icon: Icon(Icons.shop),
        onPressed: () {},
      ),
      Text(equipe + "-" +origine),
      Text("20")
    ],
  );
}
*/