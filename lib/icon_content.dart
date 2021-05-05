import 'package:flutter/material.dart';
import 'constants.dart';
class IconContent extends StatelessWidget {
  IconContent({this.icon,this.data});
  final IconData icon;
  final String data;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 80.0,),
        SizedBox(
          height: 15.0,
        ),
        Text(
          data,style: kLabelTextStyle

        )
      ],
    );
  }
}