import 'package:flutter/material.dart';
import 'package:uni_mangement_system/utils/constants.dart';
import 'package:uni_mangement_system/view/teacher/teacher.dart';

class TeacherDrawer extends StatelessWidget {
  const TeacherDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
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
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text(
              "Mange Class",
              style: TextStyle(fontSize: 16),
            ),
            leading: const Icon(
              Icons.group_outlined,
              color: kPrimaryColor,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const ClassMangemnetScreen()));
            },
          ),
          ListTile(
            title: const Text(
              "Mange Semester",
              style: TextStyle(fontSize: 16),
            ),
            leading: const Icon(
              Icons.bookmark_add_outlined,
              color: kPrimaryColor,
            ),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const SemesterScreen())),
          ),
          ListTile(
            title: const Text(
              "Mange Session",
              style: TextStyle(fontSize: 16),
            ),
            leading: const Icon(Icons.cached, color: kPrimaryColor),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const SessionScreen())),
          ),
          ListTile(
              title: const Text(
                "Mange Course Content",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const ManageCourse())),
              leading: const Icon(Icons.manage_search_outlined,
                  color: kPrimaryColor)),
          ListTile(
              title: const Text(
                "Mange Assignment",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const AssignmentScreen())),
              leading:
                  const Icon(Icons.description_outlined, color: kPrimaryColor)),
          ListTile(
              title: const Text(
                "Mange Quize",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const ManageQuize())),
              leading:
                  const Icon(Icons.ads_click_outlined, color: kPrimaryColor)),
          ListTile(
              title: const Text(
                "Mange Notification",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const ManageNotification())),
              leading: const Icon(Icons.notifications_outlined,
                  color: kPrimaryColor)),
          ListTile(
              title: const Text(
                "Mange Time Table",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const ManageTimeTable())),
              leading:
                  const Icon(Icons.punch_clock_outlined, color: kPrimaryColor)),
          ListTile(
              title: const Text(
                "Logout",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const TeacherLogin())),
              leading: const Icon(Icons.logout_outlined, color: kPrimaryColor)),
        ],
      ),
    );
  }
}
