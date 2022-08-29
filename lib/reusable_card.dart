import 'package:flutter/material.dart';


class ReuableCard extends StatelessWidget {

  ReuableCard({@required this.colour , this.cardChild , this.onTap});

  final dynamic colour;
  final Widget? cardChild;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10.0)
        ),
      ),
    );
  }
}