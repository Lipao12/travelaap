import 'package:flutter/material.dart';
import 'package:travelaap/UI/widget/welcome_info.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome_image1.png","welcome_image2.png","welcome_image3.png"
  ];
  List description_text = [
    "Mountain hikes give you an incredible sense of freedem along with endurance test",
    "Hiking the mountain fills the soul with an exhilaration that words cannot fully capture",
    "Conquering the mountain's peak brings an electrifying rush of triumph and satisfaction",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index){
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/"+images[index]
                  ),
                  fit: BoxFit.cover
                ),
              ),
              child: WelcomeInfo(text: description_text[index],index: index,),
            );
      }),
    );
  }
}
