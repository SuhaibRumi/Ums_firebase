import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_mangement_system/view/class_screen.dart';
import 'package:uni_mangement_system/view/student_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'University Mangement System',
      theme: ThemeData(
        primaryColor: const Color(0xFF202328),
        backgroundColor: const Color.fromARGB(255, 236, 236, 237),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color(0xFF63CF93)),
      ),
      home: const StudentScreen(),
    );
  }
}
