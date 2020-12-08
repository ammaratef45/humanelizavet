import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:humanelizavet/models/video.dart';
import 'package:humanelizavet/secrets.dart';

// TODO handle when excceds quota for all keys
class YoutubeService {
  static const String CHANNEL_ID = 'UC4tB7nJnqxgDlbJmOWazFiw';
  static const int MAX_RESULTS = 3;
  Map<int, String> nextPageTokens = {};
  int pagesNumber = 0;
  String apiKey = API_KEYS[0];
  int lastApiIndex = 0;

  YoutubeService._();
  static YoutubeService _instance;

  static YoutubeService get instance {
    if (_instance == null) {
      _instance = YoutubeService._();
    }
    return _instance;
  }

  Future<List<Video>> getVideos({int page = 1}) async {
    List<Video> res = [];
    String url = 'https://www.googleapis.com/youtube/v3/search?key=' +
        apiKey +
        '&channelId=' +
        CHANNEL_ID +
        '&order=date&part=snippet &type=video,id&maxResults=' +
        MAX_RESULTS.toString();
    if (page > 1) {
      url += '&pageToken=${nextPageTokens[page - 1]}';
    }
    http.Response response = await http.get(url);
    if (response.statusCode == 403) {
      if (lastApiIndex < API_KEYS.length - 1) {
        lastApiIndex++;
        apiKey = API_KEYS[lastApiIndex];
        return getVideos(page: page);
      } else {
        throw 'exceeded quota for all available keys';
      }
    }
    dynamic jsonResponse = json.decode(response.body);
    pagesNumber =
        (jsonResponse['pageInfo']['totalResults'] / MAX_RESULTS).ceil();
    nextPageTokens[page] = jsonResponse['nextPageToken'];
    List<dynamic> videos = jsonResponse['items'];
    for (final video in videos) {
      String url = 'https://www.youtube.com/watch?v=${video['id']['videoId']}';
      String title = video['snippet']['title'];
      String thumbUrl = video['snippet']['thumbnails']['medium']['url'];
      String description = video['snippet']['description'];
      Video v = Video(
          url: url, title: title, description: description, thumbUrl: thumbUrl);
      res.add(v);
    }
    return res;
  }
}
