import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import 'teacher_sign_form.dart';

class TeacherLoginBody extends StatelessWidget {
  const TeacherLoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Welcome",
                style: TextStyle(
                    fontSize: 28,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Sign in with your email and password ",
                style: TextStyle(
                    fontSize: 18,
                    color: kTextColor,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              TeacherSignForm(),
            ],
          ),
        ),
      ),
    );
  }
}
