import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:humanelizavet/widgets/header.dart';
import 'package:humanelizavet/widgets/youtube.dart';

class HomePage extends StatelessWidget {
  Widget _iframe() {
    final IFrameElement _iframeElement = IFrameElement();
    _iframeElement.height = '500';
    _iframeElement.width = '500';
    _iframeElement.src = 'https://www.youtube.com/embed/gPE4HIfTNAU';
    _iframeElement.style.border = 'none';
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iframeElement,
    );
    return HtmlElementView(
      key: UniqueKey(),
      viewType: 'iframeElement',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            SizedBox(
              width: 500,
              height: 500,
              child: _iframe(),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  'Youtube Videos',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Youtube(),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
