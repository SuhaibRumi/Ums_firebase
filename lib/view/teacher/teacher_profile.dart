import 'package:flutter/material.dart';
import 'package:uni_mangement_system/utils/constants.dart';
import '../teacher/teacher_drawer.dart';
import 'teacher_dashboard.dart';

class TeacherProfile extends StatelessWidget {
  const TeacherProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kCardColor,
          title: const Text(
            "Teacher Profile",
            textScaleFactor: 1.2,
          ),
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TeacherDashboard(
                imgUrl: "assets/img/user-1.jpg",
                heading: "Welcome Back!",
                username: "Sharyzahid@gmail.com ",
              ),
            ],
          ),
        ),
        drawer: const TeacherDrawer(),
      ),
    );
  }
}
