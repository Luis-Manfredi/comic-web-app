import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../domain/entities/comic_entity.dart';
import '../../ui/utils/api_utils.dart';

abstract class APIRemoteDataSource {
  Future<List<ComicEntity>> getComics();
}

class APIRemoteImplementation extends APIRemoteDataSource {
  final List<ComicEntity> comics = [];

  @override
  Future<List<ComicEntity>> getComics() async {
    try {
      final apiKey = APIUtils.apiKey;
      final url = 'https://comicvine.gamespot.com/api/issues/?api_key=$apiKey&format=json';

      final uri = Uri.parse(url);

      final response = await http.get(uri, headers: {
        'Content-type': 'application/json',
        'Access-Control-Allow-Origin': '*',
      });

      final Map<String, dynamic> data = jsonDecode(response.body);
      final List issues = data['results'];

      final comics = issues.map((item) => ComicEntity.fromMap(item)).toList();

      print(comics[0].title);
      print(comics[0].date);
      print(comics[0].issueNumber);
      print(comics[0].imageURL);
      // print(comics[0].characters);
      // print(comics[0].teams);
      // print(comics[0].locations);
      // print(comics[0].concepts);

      return comics;
    } catch (e) {
      print(e);
      return comics;
    }
  }
}