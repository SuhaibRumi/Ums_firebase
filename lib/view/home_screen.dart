import 'package:flutter/material.dart';
import 'package:uni_mangement_system/utils/constants.dart';
import 'package:uni_mangement_system/widgets/header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: ListView(
        children: [
          const Header(),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextField(
              style: const TextStyle(color: kTextColor),
              cursorColor: kTextColor,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                border: InputBorder.none,
                fillColor: Theme.of(context).secondaryHeaderColor,
                filled: true,
                hintText: ("Search"),
                hintStyle: const TextStyle(
                  color: kTextColor,
                  fontSize: 20,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: kTextColor,
                  size: 30,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
