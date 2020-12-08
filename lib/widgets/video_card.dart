import 'package:flutter/material.dart';
import 'package:humanelizavet/models/video.dart';

class VideoCard extends StatelessWidget {
  final Video video;
  const VideoCard({
    Key key,
    this.video,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 400,
      child: Card(
        color: Theme.of(context).accentColor,
        elevation: 14,
        margin: EdgeInsets.all(2),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                child: Image.network(
                  video.thumbUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(6),
                color: Colors.white,
                child: Center(
                  child: SelectableText(
                    video.title,
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.green,
                child: Center(
                  child: SelectableText(
                    video.description,
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
