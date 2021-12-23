import 'package:flutter/material.dart';

class test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 120,
            height: 120,
            child: Image(
                image: NetworkImage(
                    'https://cdni.rt.com/media/pics/2021.11/original/6190ffdb423604346a0d017f.JPG'))),
      ],
    );
  }
}
