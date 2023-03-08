import 'package:belajar_flutter/ui/widgets/63_movie_box.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.6,
    );
    List<String> posters = [
      "https://api.softwarekeep.com/media/nimbus/helpcenter/Capture_Scrolling_Screenshot_in_Windows-2.png",
      "https://api.softwarekeep.com/media/nimbus/helpcenter/Capture_Scrolling_Screenshot_in_Windows-4.png",
      "https://api.softwarekeep.com/media/nimbus/helpcenter/Capture_Scrolling_Screenshot_in_Windows-4.png",
      "https://api.softwarekeep.com/media/nimbus/helpcenter/Capture_Scrolling_Screenshot_in_Windows-6.png"
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("63. Widget Slider using Page View"),
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: posters.length,
        itemBuilder: (context, index) => Center(
          child: MovieBox(posters[index]),
        ),
      ),
    );
  }
}
