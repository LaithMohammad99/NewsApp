import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_laith/component/component.dart';
import 'package:news_app_laith/cubit/cubit.dart';
import 'package:news_app_laith/cubit/states.dart';

class SearchScreenn extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var search= NewsCubit.get(context).search;
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        return  Column(
          children: [
            defaultFormField(
              controller: searchController,
              label: 'Search',
              preIcon: Icons.search,
              validate: (String value) {
                if (value.isEmpty)
                { return 'Search mest be not Empty';}

                return null;
              },
              type:TextInputType.text,
              onChange: (value){
                NewsCubit.get(context).getSearch(value);

              },
            ),
            articleBuilder(search, context),
          ],
        );
      },

    );
  }
}
