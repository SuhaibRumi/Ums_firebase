import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_mangement_system/utils/constants.dart';
import 'package:uni_mangement_system/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'University Management System',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        backgroundColor: kCardColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color(0xFF63CF93)),
      ),
      home: const SplashScreen(),
    );
  }
}
