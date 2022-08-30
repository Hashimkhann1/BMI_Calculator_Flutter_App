import 'package:flutter/material.dart';

class RoundIconbutton extends StatelessWidget {

  RoundIconbutton({@required this.icon , @required this.onTap});

  final IconData? icon;
  final  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onTap,
      elevation: 10.0,
      constraints: BoxConstraints.tightFor(
          width: 44.0,
          height: 44.0
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}