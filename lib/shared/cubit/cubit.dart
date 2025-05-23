import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/states.dart';

class AppCubit extends Cubit<States>{
  AppCubit():super(AppInitialState());
  static AppCubit get(context)=>BlocProvider.of(context);

  String keyWord=" ";
  int currentIndex=0;

  void search(String value){
    keyWord=value;

    emit(AppChangeKeyState());
  }
  void changeIndex(int index){
    currentIndex=index;
    emit(AppChangeTabBarIndexState());

  }
}