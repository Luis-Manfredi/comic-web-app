import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../domain/entities/comic_entity.dart';
import '../../ui/utils/api_utils.dart';

abstract class APIRemoteDataSource {
  Future<List<ComicEntity>> getComics();
  Future<ComicEntity> getComicDetails(String apiDetailUrl);
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

      return comics;
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
  
  @override
  Future<ComicEntity> getComicDetails(String apiDetailUrl) async {
    final apiKey = APIUtils.apiKey;
    final url = '$apiDetailUrl?api_key=$apiKey&format=json';
    final uri = Uri.parse(url);

    try {
      final response = await http.get(uri, headers: {
        'Content-type': 'application/json',
        'Access-Control-Allow-Origin': '*',
      });

      final Map<String, dynamic> data = jsonDecode(response.body);
      final issue = data['results'];

      final comic = ComicEntity.fromMap(issue);

      print(comic.toMap());

      return comic;
    } catch (e) {
      print(url);
      throw Exception(e);
    }
  }
}