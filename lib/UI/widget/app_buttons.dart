import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelaap/UI/widget/app_text.dart';

class AppButton extends StatelessWidget {
  final Color color;
  final Color background_color;
  final Color border_color;
  double size;
  bool? isIcon;
  String? text;
  IconData? icon;

  AppButton({Key? key,
    this.isIcon=false,
    this.text,
    this.icon,
    required this.color,
    required this.background_color,
    required this.border_color,
    required this.size,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          border: Border.all(color: border_color),
          borderRadius: BorderRadius.circular(15),
          color: background_color,
      ),
      child: isIcon==false?Center(child: AppText(text: text!, color: color,)):Center(child: Icon(icon!, color: color,)),
    );
  }
}
