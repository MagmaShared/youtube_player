import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutube/flutube.dart';

void main() => runApp(MaterialApp(
  home: MyApp(),
));

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {

StreamController<String> streamController = new StreamController();

  String url1 = 'https://www.youtube.com/watch?v=jUCCohrxfFk';
  String url2 = 'https://www.youtube.com/watch?v=3LdnhBPL8Ds';
  bool isUrl1 = true;

  @override
  Widget build(BuildContext context) {
    print('buildou main Flutube');
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[            
            StreamBuilder<String>(
              initialData: url1,
              stream: streamController.stream,
              builder: (context, snapshot) {                
                return FluTube(                                    
                  snapshot.data,
                  autoPlay: false,
                  autoInitialize: true,
                  aspectRatio: 16 / 9,
                  allowMuting: false,
                  looping: true,
                  deviceOrientationAfterFullscreen: [
                    DeviceOrientation.portraitUp,
                    DeviceOrientation.landscapeLeft,
                    DeviceOrientation.landscapeRight,
                  ],
                  systemOverlaysAfterFullscreen: SystemUiOverlay.values,                  
                );
              }
            ),
            RaisedButton(
              child: Text('change videourl'),
              onPressed: (){
                isUrl1 = !isUrl1;
                streamController.add(isUrl1 ? url1 : url2);
              },
            )
          ],
        ),
      ),
    );
  }
}
