import 'package:flutter/material.dart';

class CardCourse extends StatelessWidget {
  const CardCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 8,
        shadowColor: Colors.grey[500],
        
      ),
    );
  }
}
