import 'package:flutter/material.dart';
import 'package:travelaap/UI/widget/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;

  ResponsiveButton({Key? key,
  this.width=90,
  this.isResponsive=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive==true?double.maxFinite:width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFF4a56a0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: isResponsive==true?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
            children: [
              isResponsive==true?AppText(text: "Book trip Now", color: Colors.white,):Container(),
              Icon(Icons.fast_forward, color: Colors.white60,)
            ],
          ),
        ),
      ),
    );
  }
}
