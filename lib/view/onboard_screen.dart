import 'package:flutter/material.dart';
import '../view/home_page.dart';
import '../utils/constants.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - 120,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
              ),
              Positioned(
                top: 50.0,
                left: 100.0,
                right: 100.0,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/img/logo.png",
                      height: 170,
                      width: 170,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "University Management System".toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                      ),
                      textScaleFactor: 1.8,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 180.0,
                left: 50.0,
                right: 50.0,
                child: Column(
                  children: const <Widget>[
                    Text(
                      "Welcome",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 29.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.1),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      "Check your assignments, and exams dates in no time on the go!",
                      style: TextStyle(
                        color: kTextColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height - 140,
                left: 100.0,
                right: 100.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const HomePage()),
                    );
                  },
                  child: Container(
                    width: 120.0,
                    height: 45.0,
                    // padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: kSecondary,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Text(
                          "GET STARTED",
                          style: TextStyle(
                            color: kCardColor,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        // SizedBox(width: 8.0),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: kCardColor,
                          size: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
