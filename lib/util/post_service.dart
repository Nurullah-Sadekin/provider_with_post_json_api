import 'package:provider_with_post_json_api/Model/postModel.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async' show Future;

import 'package:provider_with_post_json_api/util/api.dart';

List<Album> _postList = List<Album>();
Future<List<Album>> fetchPost() async {
  final response = await http.get('$url');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    List<dynamic> values = List<dynamic>();
    values = json.decode(response.body);
    if (values.length > 0) {
      for (int i = 0; i < values.length; i++) {
        if (values[i] != null) {
          Map<String, dynamic> map = values[i];
          _postList.add(Album.fromJson(map));
        }
      }
    }
    return _postList;
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}
