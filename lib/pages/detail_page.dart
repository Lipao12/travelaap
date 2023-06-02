import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelaap/UI/widget/app_buttons.dart';
import 'package:travelaap/UI/widget/app_large_text.dart';
import 'package:travelaap/UI/widget/app_text.dart';
import 'package:travelaap/UI/widget/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 3;
  int selectedIndex=-1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack( // Necessita de um pai com altura e largura
          children: [
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/welcome_image1.png"),
                      fit: BoxFit.cover
                    )
                  ),
            )),

            Positioned(
                left: 20,
                top: 70,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.menu),
                      color: Colors.white70,
                    )
                  ],
                )),

            Positioned(
                top: 330,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                    color: Colors.white
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargText(text: "Yosemite", color: Colors.black87.withOpacity(0.75),),
                          AppLargText(text: "\$ 250", color: Color(0xFF5d69d3),)
                        ],
                      ),
                      
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Color(0xFF5d69d3),),
                          SizedBox(width: 5,),
                          AppText(text: "USA, California", color: Color(0xFFababad),)
                        ],
                      ),

                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Wrap(
                            children:
                              List.generate(5, (index){
                                return Icon(Icons.star, color: gottenStars>index? Color(0xFFe7bb4e): Color(0xFF878593),);
                              }),
                          ),
                          SizedBox(width: 10,),
                          AppText(text: "("+gottenStars.toString()+".0)", color: Color(0xFF878593),),
                        ],
                      ),
                      
                      SizedBox(height: 25,),
                      AppLargText(text: "People", color: Colors.black87.withOpacity(0.75),size: 20,),
                      SizedBox(height: 5,),
                      AppText(text: "Number of people in your grup", color: Color(0xFF5d69d3),),

                      SizedBox(height: 10,),
                      Wrap(
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: (){
                              setState(() {
                                selectedIndex=index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 5),
                              child: AppButton(size: 60,
                                border_color:selectedIndex==index?Colors.black87:Color(0xfff1f1f9),
                                color:selectedIndex==index?Colors.white70:Colors.black87,
                                background_color: selectedIndex==index?Colors.black87:Color(0xfff1f1f9),
                                text: (index+1).toString(),
                                ),
                            ),
                          );
                        }),
                      ),
                      
                      SizedBox(height: 20,),
                      AppLargText(text: "Description", color: Colors.black87.withOpacity(0.75),size: 20,),
                      SizedBox(height: 5,),
                      AppText(text: "Discover Yosemite's awe-inspiring beauty.", color:Color(0xFF878593))
                    ],
                  ),
                ),
            ),

            Positioned(
              bottom: 20,
                left: 20,
                right: 20,
                child: Row(
                  children: [
                    AppButton(color: Color(0xff878593), background_color: Colors.white, border_color: Color(0xff878593), size: 60, isIcon: true, icon: Icons.favorite_border),
                    SizedBox(width: 20,),
                    ResponsiveButton(
                      isResponsive:true,

                    )
                  ],
                ),
            ),
            ],
        ),
      ),
    );
  }
}
