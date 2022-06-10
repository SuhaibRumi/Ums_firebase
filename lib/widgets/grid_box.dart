import 'package:flutter/material.dart';
import 'package:uni_mangement_system/utils/constants.dart';

class MyGirdBox extends StatelessWidget {
  const MyGirdBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kSecondary,
        height: 70,
        width: 70,
      ),
    );
  }
}
