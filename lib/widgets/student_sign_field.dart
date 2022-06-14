import 'package:flutter/material.dart';
import 'package:uni_mangement_system/utils/utlis.dart';

class SignField extends StatelessWidget {
  const SignField({
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
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextFormField(
        autofocus: true,
        style: const TextStyle(color: kTextColor),
        controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.grey[300],
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(17),
              borderSide: const BorderSide(color: kTextColor),
              gapPadding: 10),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(17),
              borderSide: const BorderSide(color: kTextColor),
              gapPadding: 10),
          border: InputBorder.none,
          labelText: lableText,
          prefixIcon: icon,
          labelStyle: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: kTextColor),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 12, color: kTextColor),
        ),
      ),
    );
  }
}
