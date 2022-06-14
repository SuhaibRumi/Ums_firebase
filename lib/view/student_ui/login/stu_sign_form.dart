import 'package:flutter/material.dart';
import 'package:uni_mangement_system/utils/constants.dart';
import 'package:uni_mangement_system/view/student_ui/stu_register.dart';
import '../../../widgets/student_sign_field.dart';
import '../../../widgets/button_widget.dart';

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
                onPrseed: () {},
                height: 50,
                width: MediaQuery.of(context).size.width - 60,
                fontsize: 22),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width - 60,
              child: OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.grey[200]),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const StudentRegister()));
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  'Forget Password?',
                  style: TextStyle(fontSize: 16),
                ))
          ],
        ),
      ),
    );
  }
}
