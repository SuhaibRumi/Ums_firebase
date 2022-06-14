import 'package:flutter/material.dart';
import '../../view.dart';
import '../../../utils/constants.dart';

class StudentLoginBody extends StatelessWidget {
  const StudentLoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
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
                "Welcome Back",
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
              SizedBox(
                height: 30,
              ),
              StudentSignForm(),
            ],
          ),
        ),
      ),
    ));
  }
}
