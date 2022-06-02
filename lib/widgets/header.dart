import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 20, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset("assets/img/logo.png", height: 70),
          const Text(
            "Punjab Universty",
            style: TextStyle(
                color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage("assets/img/logo.png"),
          )
        ],
      ),
    );
  }
}
