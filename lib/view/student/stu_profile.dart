import 'package:flutter/material.dart';
import 'package:uni_mangement_system/view/student/stu_drawer.dart';
import 'package:uni_mangement_system/view/student/stu_dashboard.dart';

import '../../utils/utlis.dart';

class StudentProfile extends StatelessWidget {
  const StudentProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kCardColor,
          title: const Text(
            "Student Profile",
            textScaleFactor: 1.2,
          ),
        ),
        body: Column(
          children: <Widget>[
            StudentDashboard(
              heading: "Welcome Student".toUpperCase(),
              imgUrl: 'assets/img/user-1.jpg',
              username: "Arsalnali@gmail.com",
            ),
          ],
        ),
        drawer: const StudentDrawer(),
      ),
    );
  }
}
