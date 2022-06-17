import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Function() onPrseed;
  final double height;
  final double width;
  final double fontsize;
  final Color color;

  const MyButton({
    Key? key,
    required this.text,
    required this.onPrseed,
    required this.height,
    required this.width,
    required this.fontsize,
    required this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      // shadowColor: Colors.black,
      elevation: 3.5,
      color: color,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onPrseed,
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              letterSpacing: 1.1,
              fontSize: fontsize,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
