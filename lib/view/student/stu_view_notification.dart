import 'package:flutter/material.dart';
import 'package:uni_mangement_system/widgets/notification.dart';

import '../../utils/utlis.dart';

class ViewNotification extends StatelessWidget {
  const ViewNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: kCardColor,
            title: const Text("View Notifications")),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return const CardNotification();
            }),
      ),
    );
  }
}
