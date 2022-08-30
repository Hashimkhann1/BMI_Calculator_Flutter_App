import 'package:flutter/material.dart';
import '../constant.dart'; //file

class ButtomButton extends StatelessWidget {

  ButtomButton({@required this.buttomTitle , @required this.onTap});
  final VoidCallback? onTap;
  final String? buttomTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
          buttomTitle.toString(),
            style: kCalculateButton,
          ),
        ),
        color: kBottomContaierColor,
        margin: const EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 18.0),
        width: double.infinity,
        height: kBodyBottomContainer,

      ),
    );
  }
}