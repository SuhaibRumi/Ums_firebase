import 'package:flutter/material.dart';
import 'package:uni_mangement_system/utils/constants.dart';
import 'package:uni_mangement_system/widgets/assingment_card.dart';

class ViewAssignment extends StatelessWidget {
  const ViewAssignment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: kCardColor, title: const Text("View Assignments")),
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return const CardAssingmnet();
            }),
      ),
    );
  }
}
