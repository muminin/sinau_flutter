// * using audioplayers: ^0.13.0

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AudioPlayer audioPlayer;
  String duration = "00:00:00.000000";

  _MyAppState() {
    audioPlayer = AudioPlayer();
    audioPlayer.onPositionChanged.listen((duration) {
      setState(() {
        this.duration = duration.toString();
      });
    });

    audioPlayer.setReleaseMode(ReleaseMode.loop);
  }

  void play(String url) async {
    await audioPlayer.play(UrlSource(url));
  }

  void pause() async {
    await audioPlayer.pause();
  }

  void stop() async {
    await audioPlayer.stop();
    setState(() {
      duration = "00:00:00.000000";
    });
  }

  void resume() async {
    await audioPlayer.resume();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("32. Memainkan Musik / Sound"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  play(
                      "https://ghantalele.com/uploads/files/data-11/5152/Tujh%20Mein%20Rab%20Dikhta%20Hai%20-%20Female_192(Ghantalele.com).mp3");
                },
                child: const Text("Play"),
              ),
              ElevatedButton(
                onPressed: () {
                  pause();
                },
                child: const Text("Pause"),
              ),
              ElevatedButton(
                onPressed: () {
                  stop();
                },
                child: const Text("Stop"),
              ),
              ElevatedButton(
                onPressed: () {
                  resume();
                },
                child: const Text("Resume"),
              ),
              Text(
                duration,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
