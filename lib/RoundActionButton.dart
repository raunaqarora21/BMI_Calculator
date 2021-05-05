import 'package:flutter/material.dart';
class RoundActionButton extends StatelessWidget {
  RoundActionButton({this.icon,this.onPress});
  final IconData icon;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      elevation: 6.0,
      fillColor: Color(0xFF4C4F5E),
      onPressed: onPress,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,

      ),



    );
  }
}