import 'package:flutter/material.dart';

import '../../utils/utlis.dart';
import 'login_body.dart';

class TeacherLogin extends StatelessWidget {
  const TeacherLogin({Key? key}) : super(key: key);

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
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
            textScaleFactor: 1.2,
          ),
        ),
        body: const TeacherLoginBody(),
      ),
    );
  }
}
