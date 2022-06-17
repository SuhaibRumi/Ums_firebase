import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../view/teacher/teacher_login.dart';
import '../widgets/custom_button.dart';
import 'student/stu_login.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kCardColor,
        body: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/img/logo.png",
                  fit: BoxFit.contain,
                  height: 250,
                  width: 300,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                " University of Punjab".toUpperCase(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    color: Colors.white),
                textScaleFactor: 1.8,
              ),
              const SizedBox(
                height: 70,
              ),
              Text(
                " Select your Identity".toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
                textScaleFactor: 1.3,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyButton(
                      color: kSecondary,
                      text: "Student".toUpperCase(),
                      onPrseed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const StudentLogin()));
                      },
                      height: 45,
                      width: 140,
                      fontsize: 18),
                  MyButton(
                      color: kSecondary,
                      text: "Teacher".toUpperCase(),
                      onPrseed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const TeacherLogin()));
                      },
                      height: 45,
                      width: 140,
                      fontsize: 18,),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
