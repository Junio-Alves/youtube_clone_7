import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myapp/model/video.dart';

const chaveYoutubeApi = "AIzaSyCSZhfDEMv-QFV7042fWK5KtWOrIHYv5x0";
const urlBase = "https://www.googleapis.com/youtube/v3/search?";
const maxResult = 20;

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    final response = await http.get(Uri.parse(
        "${urlBase}part=snippet&maxResults=$maxResult&type=video&q=$pesquisa&key=$chaveYoutubeApi"));

    List<Video> videos = [];
    if (response.statusCode == 200) {
      final dadosJson = jsonDecode(response.body);
      for (Map<String, dynamic> video in dadosJson["items"]) {
        videos.add(Video.converterJson(video));
      }
      return videos;
    } else {
      return videos;
    }
  }
}
