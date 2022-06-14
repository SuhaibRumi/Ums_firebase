import 'package:flutter/material.dart';
import 'package:uni_mangement_system/utils/constants.dart';
import 'package:uni_mangement_system/view/view.dart';

class StudentLogin extends StatelessWidget {
  const StudentLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[100],
        elevation: 0,
        title: const Text(
          "Sign in",
          style: TextStyle(color: kTextColor, fontSize: 22),
        ),
      ),
      
      body: const StudentLoginBody(),
    );
  }
}
