import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_laith/cubit/states.dart';
import 'package:news_app_laith/remote/dio_helper.dart';

class NewsCubitTow extends Cubit<NewsStates> {

  NewsCubitTow() :super (NewsintialState());

  static NewsCubitTow get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeMode()
  {
    isDark = !isDark;
    emit(NewsChangeAppModeState());

  }

}
