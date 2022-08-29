import 'package:flutter/material.dart';
import 'constant.dart'; //file


class iconContent extends StatelessWidget {

  iconContent(this.icon , this.label);

  final IconData? icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 54.0,
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          label,
          style: KLabelTextStyle,
        )
      ],
    );
  }
}