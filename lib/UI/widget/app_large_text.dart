import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppLargText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;

  const AppLargText({Key? key,
    this.size = 30,
    this.color=Colors.white60,
    required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold
      ),
    );
  }
}
