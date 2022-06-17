import 'package:flutter/material.dart';
import 'package:uni_mangement_system/utils/constants.dart';
import 'package:uni_mangement_system/widgets/custom_outline_button.dart';
import '../student/student.dart';
import '../../widgets/sign_in_field.dart';
import '../../widgets/custom_button.dart';

class StudentSignForm extends StatefulWidget {
  const StudentSignForm({Key? key}) : super(key: key);

  @override
  State<StudentSignForm> createState() => _StudentSignFormState();
}

class _StudentSignFormState extends State<StudentSignForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 32,
        ),
        child: Column(
          children: [
            SignField(
              controller: _emailController,
              lableText: 'Email',
              hintText: 'Enter your email',
              icon: const Icon(Icons.person),
            ),
            const SizedBox(
              height: 30,
            ),
            SignField(
              controller: _passwordController,
              lableText: 'Password',
              hintText: 'Enter your Password',
              icon: const Icon(Icons.lock),
            ),
            const SizedBox(
              height: 30,
            ),
            MyButton(
                color: kPrimaryColor,
                text: 'SIGN IN',
                onPrseed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const StudentProfile()));
                },
                height: 50,
                width: MediaQuery.of(context).size.width - 60,
                fontsize: 20),
            const SizedBox(
              height: 30,
            ),
            MyOutlineButton(
                text: "Register",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const StudentRegister()));
                }),
            const SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  'Forget Password?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ))
          ],
        ),
      ),
    );
  }
}
