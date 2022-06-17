import 'package:flutter/material.dart';
import 'package:uni_mangement_system/utils/constants.dart';
import 'package:uni_mangement_system/view/student/profile_detials.dart';
import 'package:uni_mangement_system/widgets/widget.dart';

class StudentDashboard extends StatelessWidget {
  const StudentDashboard(
      {Key? key,
      required this.heading,
      required this.username,
      required this.imgUrl})
      : super(key: key);
  final String heading, username, imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 8,
        shadowColor: Colors.grey[500],
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(imgUrl),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                heading,
                style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                username,
                style: const TextStyle(color: kTextColor, fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              const ProfileDetails(
                title: "Name :",
                desc: "Arslan ALi",
              ),
              const ProfileDetails(
                title: "Class Name :",
                desc: "BSCS",
              ),
              const ProfileDetails(
                title: "Session:",
                desc: " 2021-2023 ",
              ),
              const ProfileDetails(
                title: "Semesteer :",
                desc: "3rd",
              ),
              const ProfileDetails(
                title: "Reg# :",
                desc: "343212",
              ),
              const ProfileDetails(
                title: "Roll No# :",
                desc: "BS1234",
              ),
              MyButton(
                  text: "Edit Profile",
                  onPrseed: () {},
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  fontsize: 15,
                  color: kPrimaryColor)
            ],
          ),
        ),
      ),
    );
  }
}
