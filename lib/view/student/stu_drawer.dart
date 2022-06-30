import 'package:flutter/material.dart';
import 'package:uni_mangement_system/utils/constants.dart';
import 'package:uni_mangement_system/view/student/stu_view_coures.dart';
import 'package:uni_mangement_system/view/student/stu_view_notification.dart';
import 'package:uni_mangement_system/view/student/stu_view_assignmet.dart';
import 'package:uni_mangement_system/view/student/stud_view_quiz.dart';
import 'package:uni_mangement_system/view/student/student.dart';

class StudentDrawer extends StatelessWidget {
  const StudentDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        Container(
          width: double.infinity,
          height: 160,
          color: kCardColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage("assets/img/user-1.jpg"),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "User Name",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              Text(
                "xyz@gmail.com",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        ),
        ListTile(
          title: const Text("View Assignment"),
          leading: const Icon(
            Icons.menu_book_outlined,
            color: kPrimaryColor,
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const ViewAssignment()));
          },
        ),
        ListTile(
          title: const Text("View Course"),
          leading: const Icon(
            Icons.description_outlined,
            color: kPrimaryColor,
          ),
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => const ViewCourse())),
        ),
        ListTile(
          title: const Text("View Quize"),
          leading: const Icon(Icons.ads_click_outlined, color: kPrimaryColor),
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => const ViewQuiz())),
        ),
        ListTile(
          title: const Text("View Notification"),
          leading: const Icon(Icons.notifications_active_outlined,
              color: kPrimaryColor),
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => const ViewNotification())),
        ),
        ListTile(
          title: const Text("Download TimeTable"),
          leading: const Icon(Icons.download_outlined, color: kPrimaryColor),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Logout"),
          leading: const Icon(Icons.logout_outlined, color: kPrimaryColor),
          onTap: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const StudentLogin())),
        ),
      ]),
    );
  }
}
