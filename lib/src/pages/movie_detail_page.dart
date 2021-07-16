import 'package:cinemas/src/providers/movie_detail_provider.dart';
import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {
  String idMovie;
  MovieDetail(this.idMovie);
  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Movie')), body: _movieScreen());
  }

  Widget _movieScreen() {
    return FutureBuilder(
      future: movieDetailProvider.cargarData(widget.idMovie),
      initialData: [],
      builder: (context, AsyncSnapshot<dynamic> snapshot) {
        Map<String, dynamic> data = snapshot.data!;
        return ListView(
          padding: EdgeInsets.all(10),
          children: [
            Image(
                image: NetworkImage(
                    'https://image.tmdb.org/t/p/w500' + data['poster_path'])),
            Text(
              data['original_title'],
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 23.0),
            ),
            Row(
              children: [
                Icon(Icons.star),
                Text(
                  data['vote_average'].toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 23.0),
                ),
              ],
            ),
            Divider(),
            Text(
              'OverView',
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),
            ),
            Text(
              data['overview'],
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 13.0),
            ),
            Divider(),
          ],
        );
      },
    );
  }
}
