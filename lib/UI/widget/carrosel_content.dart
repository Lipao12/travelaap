import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CorroselContent extends StatelessWidget {
  const CorroselContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15, top: 10),
      width: 200,
      height: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white60,
          image: DecorationImage(
            image: AssetImage(
                "assets/welcome_image2.png"
            ),
            fit: BoxFit.cover,
          )
      ),
    );
  }
}
