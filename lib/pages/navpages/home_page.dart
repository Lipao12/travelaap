import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelaap/UI/widget/app_large_text.dart';
import 'package:travelaap/UI/widget/app_text.dart';
import 'package:travelaap/UI/widget/explore_more_widget.dart';

import '../../UI/widget/carrosel_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{ // o 'with TickerProviderStateMixin' para utilizar o tab bar controller
  var images = { // procurar imagens: balloning, hiking, kayaking, snorkling -- mudar para imagens de icones
    "camping.jpg":"Camping",
    "kayaking.png":"Kayaking",
    "view.png":"View",
    "walking.jpg":"Walking",
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Menu Text
          Container(
            padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu, size: 30, color: Colors.black87,),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5)
                  ),
                )
              ],
            ),
          ),

          SizedBox(height: 40,),
          Container(
              margin: const EdgeInsets.only(left: 20),
              child: AppLargText(text: "Discover", color: Colors.black87,)
          ),

          SizedBox(height: 30,),
          // Cirando um TabBar
          Container(
            child: Align(
              alignment: Alignment.centerLeft, // só irá funcionar junto com o isScrollable
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.black87,
                unselectedLabelColor: Colors.grey.withOpacity(0.7),
                isScrollable: true,
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                indicatorSize: TabBarIndicatorSize.label,
                indicator: CircleTabIndicator(color: Color(0xFF4a56a0), radius: 4),
                tabs: [
                  Tab(text: "Places",),
                  Tab(text: "Inspirations",),
                  Tab(text: "Emotions",),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index){
                    return CorroselContent();
                  }
                ),
                Text("Part2"),
                Text("3")
              ],
            ),
          ),

          SizedBox(height: 30,),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargText(text: "Explore More", color: Colors.black87, size: 22,),
                AppText(text: "See all", color: Color(0xFF989ACD),)
              ],
            ),
          ),

          SizedBox(height: 5,),
          Container(
            height: 100,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
                itemCount: images.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index){
              return Container(
                margin: EdgeInsets.only(right: 30),
                child: Column(
                  children: [
                    ExploreMoreWidget(imageName:images.keys.elementAt(index)),
                    SizedBox(height: 5,),
                    AppText(text: images.values.elementAt(index), color: Color(0xFF878593),size: 11,)
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration{
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color:color, radius:radius);
  }


}

class _CirclePainter extends BoxPainter{
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color=color;
    _paint.isAntiAlias=true;
    final Offset circleOffset=Offset(configuration.size!.width/2 - radius/2,
                                      configuration.size!.height-radius);
    
    canvas.drawCircle(offset+circleOffset, radius, _paint);
  }

}
