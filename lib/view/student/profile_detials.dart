import 'package:flutter/material.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({
    Key? key,
    required this.title,
    required this.desc,
  }) : super(key: key);
  final String title, desc;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              desc,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Divider(
              thickness: 2.2,
            ),
          ],
        ),
        const Divider(
          thickness: 2.2,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}