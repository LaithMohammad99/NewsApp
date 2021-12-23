import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_laith/component/component.dart';
import 'package:news_app_laith/cubit/cubit.dart';
import 'package:news_app_laith/cubit/cubit2.dart';
import 'package:news_app_laith/cubit/states.dart';
import 'package:news_app_laith/moduels/busniss/busniss.dart';
import 'package:news_app_laith/moduels/search/search.dart';
import 'package:news_app_laith/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            actions: [IconButton(onPressed: () {

              navigatTo(context, SearchScreen());

            }, icon: Icon(
                Icons.search
            ),
            ),
              IconButton(onPressed: (){
                NewsCubitTow.get(context).changeMode();
              }, icon: Icon(Icons.brightness_4_outlined))],
            title: Text('News Cloud'),
          ),
          body: cubit.screen[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottoms,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
          ),
        );
      },
    );
  }
}
