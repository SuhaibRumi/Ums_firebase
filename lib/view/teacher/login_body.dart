import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import 'teacher_sign_form.dart';

class TeacherLoginBody extends StatelessWidget {
  const TeacherLoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            children: const [
              SizedBox(
                height: 20,
              ),
              Text(
                "TEACHER'S",
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
              SizedBox(height: 30),
              TeacherSignForm(),
            ],
          ),
        ),
      ),
    );
  }
}
