import 'dart:async';
import 'dart:convert';
import 'dart:io' show HttpHeaders;
import 'package:movies_db/constants/api.dart';
import 'package:movies_db/exceptions/api_exceptions.dart';
import 'package:movies_db/models/movie.dart';
import 'package:http/http.dart' as http;

class MovieService {
  const MovieService();

  //function to fetch movies in json format from the api and converting it to dart model class
  Future<List<Movie>> fetchMovies() async {
    try {
      final http.Response response = await http.get(
        Uri.parse(moviesEndpoint),
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $accessKey'
        },
      );

      if (response.statusCode == 200) {
        return List.from(
          jsonDecode(response.body)['results'],
        )
            .cast<Map<String, dynamic>>()
            .map((movie) => Movie.fromJson(movie))
            .toList();
      } else {
        //throw if anything happen
        throw FetchingFailedException();
      }
    } catch (e) {
      rethrow;
    }
  }
}
