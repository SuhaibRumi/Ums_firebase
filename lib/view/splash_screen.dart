import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../view/onboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    showSplash();
    super.initState();
  }

  showSplash() {
    Future.delayed(
        const Duration(seconds: 10),
        () => {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const OnBoardScreen())),
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/img/splash2.json', height: 200, width: 300),
      ),
    );
  }
}
