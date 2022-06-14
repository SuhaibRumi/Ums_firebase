import 'package:flutter/material.dart';

import '../../utils/utlis.dart';
import 'body_login.dart';

class TeacherLogin extends StatelessWidget {
  const TeacherLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Sign in",
          style: TextStyle(color: kTextColor, fontSize: 22),
        ),
      ),
      body: const TeacherLoginBody(),
    );
  }
}
