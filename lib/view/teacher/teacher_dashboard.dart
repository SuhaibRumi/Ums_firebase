import 'package:flutter/material.dart';

import '../../utils/utlis.dart';
import '../../widgets/widget.dart';
import '../student/profile_detials.dart';

class TeacherDashboard extends StatelessWidget {
  const TeacherDashboard(
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
            mainAxisAlignment: MainAxisAlignment.start,
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
                desc: " Shary",
              ),
              const ProfileDetails(
                title: " Dept :",
                desc: "BSCS",
              ),
              const ProfileDetails(
                title: "Post :",
                desc: "Head of IT ",
              ),
              const ProfileDetails(
                title: "Cell No :",
                desc: "0322-5456213",
              ),
              const SizedBox(height: 10),
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
