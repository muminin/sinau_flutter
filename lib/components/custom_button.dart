import 'package:flutter/material.dart';
import 'package:division/division.dart';
import 'package:belajar_flutter/styles/custom_style.dart';

class CustomButton extends StatefulWidget {
  final ParentStyle buttonStyle;

  CustomButton(this.buttonStyle);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isTapDown = false;

  @override
  Widget build(BuildContext context) {
    return Parent(
      style: widget.buttonStyle.clone()
        ..scale((isTapDown) ? 1.1 : 1)
        ..elevation((isTapDown) ? 0 : 5),
      child: Container(
        child: Txt("division", style: CustomStyle.txtStyle),
      ),
      gesture: Gestures()
        ..onTapDown((p0) {
          setState(() {
            isTapDown = true;
          });
        })
        ..onTapUp((p0) {
          setState(() {
            isTapDown = false;
          });
        })
        ..onTapCancel(() {
          setState(() {
            isTapDown = false;
          });
        }),
    );
  }
}
