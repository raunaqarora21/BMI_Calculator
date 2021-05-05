import 'package:flutter/material.dart';

import 'constants.dart';
class BottomButton extends StatelessWidget {

  BottomButton({this.onTap,this.title});
  final Function onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: onTap,
      child: Container(

        child: Center(
          child: Text(title,
            style: kLargeButton,
          ),
        ),
        color: Color(0xFFEB1555),
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: 80.0,
      ),
    );
  }
}



