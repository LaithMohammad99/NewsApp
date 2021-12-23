import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_laith/component/component.dart';
import 'package:news_app_laith/cubit/cubit.dart';
import 'package:news_app_laith/cubit/cubit2.dart';
import 'package:news_app_laith/cubit/states.dart';

class SearchScreen extends StatelessWidget {

    var searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(context,state){} ,
      builder: (context,state){

        var list=NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child:
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Search",
                      hintText: "Search",
                      prefix: Icon(Icons.search,
                      ),
                      border: OutlineInputBorder()
                  ),

                  keyboardType: TextInputType.text,
                  controller: searchController,
                  validator: (value){
                    if(value.isEmpty){
                      return "Search Must Not Be Empty";
                    }
                    return null;
                  },
                  onChanged: (value)
                  {
                    NewsCubit.get(context).getSearch(value);
                  },
                ),
                // defaultFormField(
                //   controller:searchController ,
                //   type:TextInputType.text
                //   ,validate:(String value){
                //     if(value.isEmpty){
                //       return 'Search must not be empty';
                //     }
                //     return null;
                //   },
                //   label:'Search' ,
                //   preIcon:Icons.search,
                //   onChange: (value){
                //    NewsCubit.get(context).getSearch(value);
                //   },
                // ),
                ),
               Expanded(child: articleBuilder(list, context)),
            ],
          ),
        );
      },

    );
  }
}
