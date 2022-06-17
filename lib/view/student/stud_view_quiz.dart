import 'package:flutter/material.dart';
import 'package:uni_mangement_system/widgets/quiz_card.dart';

import '../../utils/utlis.dart';

class ViewQuiz extends StatelessWidget {
  const ViewQuiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: kCardColor, title: const Text("View Quizes")),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return const QuizCard();
            }),
      ),
    );
  }
}
