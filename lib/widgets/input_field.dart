import 'package:flutter/material.dart';
import 'package:uni_mangement_system/utils/utlis.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.controller,
    required this.lableText,
    required this.hintText,
    required this.icon,
  }) : super(key: key);
  final TextEditingController controller;
  final String lableText;
  final String hintText;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextFormField(
        autofocus: true,
        // style: const TextStyle(color: kTextColor),
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: lableText,
          prefixIcon: icon,
          labelStyle: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: kTextColor),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14, color: kTextColor),
        ),
      ),
    );
  }
}
