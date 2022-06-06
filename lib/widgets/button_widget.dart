import 'package:flutter/material.dart';

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
      color: Theme.of(context).colorScheme.secondary,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onPrseed,
        child: AnimatedContainer(
          duration: const Duration(seconds: 2),
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
