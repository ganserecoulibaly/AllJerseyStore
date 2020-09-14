import 'package:flutter/material.dart';
import 'package:all_jersey_store/home.dart';
import 'ListBundes.dart';

class bundesliga extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: buildAppBar(context, "Bundesliga"),
        body: Center(
          child: ListBundesView(),
        ));
  }

}

/*
Widget build(BuildContext context) {
  return FutureBuilder<List<ItemGrid>>(
    future: fetchGalleryData(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        List<ItemGrid> data = snapshot.data;
        return _jobsListView(data);
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }
      return CircularProgressIndicator();
    },
  );
}
*/


/*
  Widget _getGridView(BuildContext context) {
    return FutureBuilder<List<ItemGrid>>(
      future: fetchGalleryData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ItemGrid> data = snapshot.data;
          if (snapshot.data != null) {
            return GridView.builder(
                itemCount: data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  _getColumnItem(data[index].url_img,
                      data[index].equipe,
                      data[index].origine);
                });
          }
        } else {
          return Text("no data load");
        }
      },
    );
  }

  */

/*
  Future<List<ItemGrid>> fetchGalleryData() async {
    final response = await http
        .get(
        'http://www.gansere.com/ajs/select_all.php')
        .timeout(Duration(seconds: 5));

    print(response.body);

    List<ItemGrid> itemgridlist;
    Iterable l = json.decode(response.body);
    itemgridlist = (json.decode(response.body) as List).map((i) =>
        ItemGrid.fromJson(i)).toList();

    print("ORIGINEEEEE");
    print(" ORIGINE " + itemgridlist.first.origine);

    return itemgridlist;
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
        Text(equipe + "-" + origine),
        Text("20")
      ],
    );
  }
  */


