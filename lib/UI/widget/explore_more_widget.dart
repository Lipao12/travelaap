import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExploreMoreWidget extends StatelessWidget {
  final String imageName;
  const ExploreMoreWidget({Key? key,required this.imageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white60,
          image: DecorationImage(
            image: AssetImage(
                "assets/"+imageName
            ),
            fit: BoxFit.cover,
          )
      ),
    );
  }
}
