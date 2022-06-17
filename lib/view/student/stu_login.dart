import 'package:flutter/material.dart';
import 'package:uni_mangement_system/utils/constants.dart';
import 'stu_login_body.dart';

class StudentLogin extends StatelessWidget {
  const StudentLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: kCardColor,
          elevation: 0,
          title: const Text(
            "Sign in",
            textScaleFactor: 1.3,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: const StudentLoginBody(),
      ),
    );
  }
}
