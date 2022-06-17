import 'package:flutter/material.dart';
import 'package:uni_mangement_system/widgets/course_card.dart';

import '../../utils/utlis.dart';

class ViewCourse extends StatelessWidget {
  const ViewCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: kCardColor,
            title: const Text("View Course Content")),
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return const CardCourse();
            }),
      ),
    );
  }
}
