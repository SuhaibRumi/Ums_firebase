import 'package:flutter/material.dart';

class CardNotification extends StatelessWidget {
  const CardNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 8,
      shadowColor: Colors.grey[500],
      child: const ListTile(
        title: Text("Test"),
        subtitle: Text("1 #ch Data Base"),
      ),
    );
  }
}
