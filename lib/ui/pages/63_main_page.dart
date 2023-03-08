import 'dart:math';

import 'package:belajar_flutter/ui/widgets/63_movie_box.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final String title;

  MainPage({this.title = "63. Widget Slider using Page View"});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // * untuk menentukan posisi Page yang ditampilkan
  double currentPageValue = 0;
  PageController pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.6,
  );

  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        currentPageValue = pageController.page;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> posters = [
      "https://api.softwarekeep.com/media/nimbus/helpcenter/Capture_Scrolling_Screenshot_in_Windows-2.png",
      "https://api.softwarekeep.com/media/nimbus/helpcenter/Capture_Scrolling_Screenshot_in_Windows-4.png",
      "https://api.softwarekeep.com/media/nimbus/helpcenter/Capture_Scrolling_Screenshot_in_Windows-4.png",
      "https://api.softwarekeep.com/media/nimbus/helpcenter/Capture_Scrolling_Screenshot_in_Windows-6.png"
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.title),
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: posters.length,
        itemBuilder: (context, index) {
          // * hitung skala
          double diffPageValue = index - currentPageValue;
          if (diffPageValue < 0) diffPageValue *= 1;

          diffPageValue = min(1, diffPageValue);

          return Center(
            child: MovieBox(
              posters[index],
              scale: 1 - (diffPageValue * 0.3),
            ),
          );
        },
      ),
    );
  }
}
