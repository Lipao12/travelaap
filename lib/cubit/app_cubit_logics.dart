import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelaap/cubit/app_cubits.dart';
import 'package:travelaap/pages/navpages/home_page.dart';
import 'package:travelaap/pages/welcome_page.dart';

import 'app_cubit_state.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state){
          if(state is WelcomeState){
            return WelcomePage();
          }
          if(state is LoadingState){
            return Center(child: CircularProgressIndicator(),);
          }
          if(state is LoadedState){
            return HomePage();
          }
          return Container();
        },
      ),
    );
  }
}
