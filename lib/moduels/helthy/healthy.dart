import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_laith/component/component.dart';
import 'package:news_app_laith/cubit/cubit.dart';
import 'package:news_app_laith/cubit/states.dart';

class HealthyScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var listHelthy =NewsCubit.get(context).health;
        return ConditionalBuilder(
          condition: listHelthy.length>0,
          builder: (context) => ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildArticleItem(listHelthy[index],context),
              separatorBuilder: (context, index) => myDivider(),
              itemCount: 10),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
