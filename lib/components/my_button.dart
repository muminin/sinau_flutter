import 'dart:math';
import 'package:flutter/material.dart';

/// diganti dengan

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -5 / 100 * pi, // => 5 derajat
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(60),
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(60),
            border: Border.all(
              width: 3,
              color: Colors.lightBlue,
            ),
          ),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(60),
            child: InkWell(
              splashColor: Colors.yellow,
              borderRadius: BorderRadius.circular(60),
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                child: Text(
                  "division",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: "EBGaramond",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              onTap: () {},
            ),
          ),
        ),
      ),
    );
  }
}
