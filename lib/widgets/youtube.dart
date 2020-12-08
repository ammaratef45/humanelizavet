import 'package:flutter/material.dart';
import 'package:humanelizavet/models/video.dart';
import 'package:humanelizavet/services/youtube.dart';
import 'package:humanelizavet/widgets/video_card.dart';

class Youtube extends StatefulWidget {
  @override
  _YoutubeState createState() => _YoutubeState();
}

class _YoutubeState extends State<Youtube> {
  final YoutubeService youtubeService = YoutubeService.instance;
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: youtubeService.getVideos(page: currentPage),
      builder: (context, snapshot) {
        if (snapshot.hasError) return Text(snapshot.error.toString());
        if (!snapshot.hasData) return Text('loading');
        int maxPages = youtubeService.pagesNumber;
        return Column(
          children: [
            Wrap(
              children: [
                ...snapshot.data
                    .map((e) => VideoCard(
                          video: e,
                        ))
                    .toList(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  color: currentPage == 1 ? Colors.grey : Colors.black,
                  icon: Icon(Icons.arrow_back),
                  onPressed: currentPage == 1
                      ? null
                      : () {
                          currentPage--;
                          setState(() {});
                        },
                ),
                IconButton(
                  color: currentPage == maxPages ? Colors.grey : Colors.black,
                  icon: Icon(Icons.arrow_forward),
                  onPressed: currentPage == maxPages
                      ? null
                      : () {
                          currentPage++;
                          setState(() {});
                        },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
