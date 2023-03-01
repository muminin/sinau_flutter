import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

// * Sebaiknya dibuat di file berbeda, jangan di main nya
class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  final Color pinkColor = const Color(0xffff80c0);
  final Color greenColor = const Color(0xff80ffbf);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "23. Opacity (Custom Card dengan Latar Bercorak)",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: pinkColor,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  pinkColor,
                  greenColor,
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.7,
              child: Card(
                elevation: 10,
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 0.05,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: const DecorationImage(
                            image:
                                AssetImage('assets/images/water-pattern.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                        ),
                        image: DecorationImage(
                          image: AssetImage('assets/images/anushka_sharma.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          20,
                          50 + MediaQuery.of(context).size.height * 0.35,
                          20,
                          20),
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: getText("Anushka Sharma on Short Hair Cut",
                                const Color(0xffff80c0),
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                fontSize: 25),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 20, 0, 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                getText("Posted on ", Colors.grey),
                                getText("March, 01 2023", pinkColor),
                              ],
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              const Spacer(
                                flex: 10,
                              ),
                              Icon(
                                Icons.thumb_up,
                                size: 18,
                                color: pinkColor,
                              ),
                              const Spacer(
                                flex: 1,
                              ),
                              getText("99", Colors.grey, fontSize: 18),
                              const Spacer(
                                flex: 5,
                              ),
                              Icon(
                                Icons.comment,
                                size: 18,
                                color: pinkColor,
                              ),
                              const Spacer(
                                flex: 1,
                              ),
                              getText("888", Colors.grey, fontSize: 18),
                              const Spacer(
                                flex: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Text getText(String text, Color colorData,
      {double fontSize = 14.0,
      int maxLines = 0,
      TextAlign textAlign = TextAlign.start}) {
    return Text(
      text,
      maxLines: (maxLines > 0) ? maxLines : null,
      textAlign: textAlign,
      style: TextStyle(
        color: colorData,
        fontSize: fontSize,
        fontFamily: "EBGaramond",
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
