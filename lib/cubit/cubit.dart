import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_laith/cubit/states.dart';
import 'package:news_app_laith/moduels/busniss/busniss.dart';
import 'package:news_app_laith/moduels/entertainment/entertainment.dart';
import 'package:news_app_laith/moduels/helthy/healthy.dart';
import 'package:news_app_laith/moduels/since/sinces.dart';
import 'package:news_app_laith/moduels/sports/sports.dart';
import 'package:news_app_laith/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsintialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<BottomNavigationBarItem> bottoms = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports_basketball_outlined), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
    BottomNavigationBarItem(icon: Icon(Icons.healing), label: 'Healthy'),
    BottomNavigationBarItem(icon: Icon(Icons.gamepad), label: 'Entertainment'),
  ];
  List<Widget> screen = [
    BusnissScreen(),
    SportScreen(),
    SinceScreen(),
    HealthyScreen(),
    EntertainmentScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) getSport();
    if (index == 2) getScince();
    if (index == 3) getHealth();
    if (index == 4) getEntrtainment();

    emit(NewsBottomNavState());
  }

  List<dynamic> busniss = [];

  void getBusniss() {
    emit(NewsGetBusnissLoadingState());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': 'd1a73080a9ff415aa75ee46ec3bb142c'
    }).then((value) {
      busniss = value.data['articles'];
      // print(busniss[0]['title'].toString());

      emit(NewsGetBusnissSuccState());
    }).catchError((Error) {
      print(Error.toString());

      emit(NewsGetBusnissErorrState(error: Error.toString()));
    });
  }

  List<dynamic> sport = [];

  void getSport() {
    emit(NewsGetSportsLoadingState());

    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': 'd1a73080a9ff415aa75ee46ec3bb142c'
    }).then((value) {
      sport = value.data['articles'];
      // print(busniss[0]['title'].toString());

      emit(NewsGetSportsSuccState());
    }).catchError((Error) {
      print(Error.toString());

      emit(NewsGetSportsErorrState(error: Error.toString()));
    });
  }

  List<dynamic> scince = [];

  void getScince() {
    emit(NewsGetScinceLoadingState());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': 'd1a73080a9ff415aa75ee46ec3bb142c'
    }).then((value) {
      scince = value.data['articles'];
      // print(busniss[0]['title'].toString());

      emit(NewsGetScinceSuccState());
    }).catchError((Error) {
      print(Error.toString());

      emit(NewsGetScinceErorrState(error: Error.toString()));
    });
  }

  List<dynamic> health = [];

  void getHealth() {
    emit(NewsGetHealthLoadingState());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'health',
      'apiKey': 'd1a73080a9ff415aa75ee46ec3bb142c'
    }).then((value) {
      health = value.data['articles'];
      // print(busniss[0]['title'].toString());

      emit(NewsGetHealthSuccState());
    }).catchError((Error) {
      print(Error.toString());

      emit(NewsGetHealthErorrState(error: Error.toString()));
    });
  }

  List<dynamic> entertainment = [];

  void getEntrtainment() {
    emit(NewsGetEntertainmentLoadingState());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'entertainment',
      'apiKey': 'd1a73080a9ff415aa75ee46ec3bb142c'
    }).then((value) {
      entertainment = value.data['articles'];
      // print(busniss[0]['title'].toString());

      emit(NewsGetEntertainmentSuccState());
    }).catchError((Error) {
      print(Error.toString());

      emit(NewsGetEntertainmentErorrState(error: Error.toString()));
    });
  }

  List<dynamic> search = [];

  void getSearch(String value){
     emit(NewsGetSearchLoadingState());
     search = [];
     // emit(NewsGetSearchLoadingState());
     DioHelper.getData(
         url: 'v2/everything',
         query: {
            'q':'$value',
            'apiKey':'d1a73080a9ff415aa75ee46ec3bb142c',
         }).then((value){
        search = value.data['articles'];
        print(search[0]['title']);
        emit(NewsGetSearchSuccState());
     }).catchError((error){
        // emit(NewsGetSearchErorrState(error.toString()));
     });
  }

  // void getSearch(String value) {
  //   search = [];
  //   emit(NewsGetSearchLoadingState());
  //
  //   DioHelper.getData(
  //       url: 'v2/everything',
  //       query: {'q': 'tesla', 'apiKey': 'd1a73080a9ff415aa75ee46ec3bb142c'}).then((value) {
  //         search=value.data['articles'];
  //         print(search[0]['title']);
  //         emit(NewsGetSearchSuccState());
  //
  //   }).catchError((error){
  //     emit(NewsGetSearchErorrState(error: error.toString()));
  //   });
  // }

}
