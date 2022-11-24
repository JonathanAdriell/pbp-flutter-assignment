import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/model/movie.dart';

Future<List<Movie>> fetchMovie() async {
  var url = Uri.parse('https://jonathan-tugas2.herokuapp.com/mywatchlist/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object Movie
  List<Movie> watchList = [];
  for (var d in data) {
    if (d != null) {
      watchList.add(Movie.fromJson(d));
    }
  }

  return watchList;
}