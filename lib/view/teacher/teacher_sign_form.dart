import 'package:flutter/material.dart';
import 'package:uni_mangement_system/utils/constants.dart';
import '../../widgets/custom_outline_button.dart';
import '../../widgets/widget.dart';
import 'teacher_profile.dart';
import 'teacher_register.dart';

class TeacherSignForm extends StatefulWidget {
  const TeacherSignForm({Key? key}) : super(key: key);

  @override
  State<TeacherSignForm> createState() => _TeacherSignFormState();
}

class _TeacherSignFormState extends State<TeacherSignForm> {
  final _teacherEmailController = TextEditingController();
  final _teacherPasswordController = TextEditingController();
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
              controller: _teacherEmailController,
              lableText: 'Email',
              hintText: 'Enter your email',
              icon: const Icon(Icons.person),
            ),
            const SizedBox(
              height: 30,
            ),
            SignField(
              controller: _teacherPasswordController,
              lableText: 'Password',
              hintText: 'Enter your Password',
              icon: const Icon(Icons.lock),
            ),
            const SizedBox(
              height: 30,
            ),
            MyButton(
                color: kPrimaryColor,
                text: 'Sign In'.toUpperCase(),
                onPrseed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const TeacherProfile(),
                      ));
                },
                height: 50,
                width: MediaQuery.of(context).size.width - 60,
                fontsize: 18),
            const SizedBox(
              height: 30,
            ),
            MyOutlineButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TeacherRegister(),
                    ));
              },
              text: "Register",
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  'Forget Password?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
