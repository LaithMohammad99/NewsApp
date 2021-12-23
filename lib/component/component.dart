import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:news_app_laith/moduels/webviwe/webviwe.dart';
import 'package:webview_flutter/webview_flutter.dart';

Widget buildArticleItem(  article, context) => InkWell(
  onTap: (){navigatTo(context, WebViewScreen(article['url']),);},
  child:   Padding(

        padding: const EdgeInsets.all(20.0),

        child: Row(

          children: [

            Container(

              width: 120.0,

              height: 120.0,

              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(10),

                image: DecorationImage(

                  image: NetworkImage(

                    '${article['urlToImage']}',

                  ),

                  fit: BoxFit.cover,

                ),

              ),

            ),

            SizedBox(

              width: 20.0,

            ),

            Expanded(

              child: Container(

                height: 120.0,

                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Expanded(

                      child: Text(

                        '${article['title']}',

                        style: Theme.of(context).textTheme.bodyText1,

                        maxLines: 3,

                        overflow: TextOverflow.ellipsis,

                      ),

                    ),

                    Text(

                      '${article['publishedAt']}',

                      style: TextStyle(color: Colors.grey),

                    ),

                  ],

                ),

              ),

            )

          ],

        ),

      ),
);

Widget myDivider() => Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        width: double.infinity,
        color: Colors.grey[300],
        height: 1,
      ),
    );

Widget defaultFormField({
  @required String label,
  @required IconData preIcon,
  @required TextEditingController controller,
  @required TextInputType type,
  Function onSubmit,
  Function onChange,
  @required Function validate,
  IconData suFix,
  bool obText = true,
  Function suffpreesd,
}) =>
    TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        prefixIcon: Icon(preIcon),
        suffixIcon: IconButton(
          icon: Icon(suFix),
          onPressed: () {
            suffpreesd;
          },
        ),
        //suffixIcon: Icon(Icons.edit)
      ),
      keyboardType: type,
      onFieldSubmitted: (value) {
        onSubmit;
      },
      onChanged: (value) {
        onChange;
      },
      validator: (value) {
        return validate(value);
      },
      obscureText: obText,
      // obscureText:suffpreesd!(),
    );

void navigatTo(context,widgt) => Navigator.push(context, MaterialPageRoute(
        builder: (context) => widgt,
    ),);

Widget articleBuilder(list, context){
  return  ConditionalBuilder(
    condition: list.length > 0,
    builder:(context) => ListView.separated(
        physics: BouncingScrollPhysics(),//disable the blue shade
        itemBuilder: (context,index)=>buildArticleItem(list[index],context),
        separatorBuilder: (context , index)=>myDivider(),
        itemCount: 10),
    fallback:(context) =>Center(child: CircularProgressIndicator()),);
}
