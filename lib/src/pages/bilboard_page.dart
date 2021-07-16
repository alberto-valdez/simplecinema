import 'package:cinemas/src/pages/movie_detail_page.dart';
import 'package:cinemas/src/pages/theartre_detail_page.dart';
import 'package:cinemas/src/providers/movies_provider.dart';
import 'package:flutter/material.dart';

class Bilboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('On Playing')),
      body: _movie(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_on),
        onPressed: () => {
          Navigator.of(context)
              .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
            return TheatreDetail();
          }))
        },
      ),
    );
  }

  Widget _movie() {
    return FutureBuilder(
      future: moviesProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listaItems(snapshot.data!, context),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> items = [];

    data.forEach((i) {
      final wt = InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
            return MovieDetail(i['id'].toString());
          }));
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(3, 13, 3, 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23.0),
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                    offset: Offset(2.0, 10.0))
              ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(23.0),
            child: Image(
                image: NetworkImage(
                    'https://image.tmdb.org/t/p/w500' + i['poster_path'])),
          ),
        ),
      );
      items..add(wt);
    });

    return items;
  }
}
