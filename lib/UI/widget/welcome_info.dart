import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelaap/UI/widget/app_large_text.dart';
import 'package:travelaap/UI/widget/app_text.dart';
import 'package:travelaap/UI/widget/responsive_button.dart';
import 'package:travelaap/cubit/app_cubits.dart';

class WelcomeInfo extends StatelessWidget {
  final int index;
  final String text;
  const WelcomeInfo({Key? key, required this.text,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(top:150, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start, //todos os widgets comecando no lado esquerdo
            children: [
              AppLargText(text: "Trips"),
              AppText(text: "Mountain", size: 30,),
              SizedBox(child: Container(height: 15,),),
              Container(
                width: 250,
                child: AppText(
                  text: text,
                  size: 14,
                ),
              ),
              SizedBox(child: Container(height: 40,),),
              GestureDetector(
                onTap: (){
                  BlocProvider.of<AppCubits>(context).getData();
                },
                child: Container(
                    width: 200,
                    child: Row( // pois estuo usando flexible no botao
                      children: [
                        ResponsiveButton(),
                      ],
                    )),
              )
            ],
          ),
          Column(
            children: List.generate(3, (indexDots){
              return Container(
                margin: const EdgeInsets.only(bottom: 2),
                width: 8,
                height: index==indexDots?25:8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: index==indexDots?Color(0xFF4a56a0):Color(0xFF4a56a0).withOpacity(0.5),
                ),
              );
            }), // Fazer os 3 pontos que aparecem na direita
          )
        ],
      ),
    );
  }
}
