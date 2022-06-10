import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 15, 25, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset("assets/img/logo.png", height: 65),
          const Text(
            "Punjab Universty",
            style: TextStyle(
                color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage("assets/img/user-1.jpg"),
          )
        ],
      ),
    );
  }
}
