import 'package:flutter/material.dart';
import 'package:uni_mangement_system/utils/constants.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Function() onPrseed;
  final double height;
  final double width;
  final double fontsize;

  const MyButton({
    Key? key,
    required this.text,
    required this.onPrseed,
    required this.height,
    required this.width,
    required this.fontsize,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: kSecondary,
      elevation: 3.5,
      color: kPrimaryColor,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onPrseed,
        child: AnimatedContainer(
          duration: const Duration(seconds: 3),
          width: width,
          height: height,
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              letterSpacing: 1.2,
              fontSize: fontsize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
