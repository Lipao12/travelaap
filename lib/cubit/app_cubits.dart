import 'package:bloc/bloc.dart';
import 'package:travelaap/cubit/app_cubit_state.dart';
import 'package:travelaap/services/data_servicaes.dart';

class AppCubits extends Cubit<CubitStates>{
  AppCubits({required this.data}) : super(InitialState()){
    emit(WelcomeState());
  }

  final DataServices data;
  late final places;
  void getData() async{
    try{
      emit(LoadingState());
      places = await data.getInfo(); //await -- espera a linha ser carregada para entao passar para a proxima
      emit(LoadedState(places));
    }catch(e){
      print(e);
    }
  }
}