import 'package:flutter/material.dart';
import 'package:uni_mangement_system/utils/constants.dart';
import 'package:uni_mangement_system/widgets/text_widget.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 8,
        shadowColor: Colors.grey[500],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const TextWidget(
                color: kTextColor,
                text: 'Computer',
                fontSize: 20,
              ),
              const Divider(
                thickness: 2.2,
              ),
              const TextWidget(
                  text: "Quize #: 10", color: kTextColor, fontSize: 18),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 2.2,
              ),
              InkWell(
                onTap: () {},
                child: SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: const <Widget>[
                      Icon(
                        Icons.download,
                        size: 22,
                        color: kSecondary,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        " Download PDF File",
                        style: TextStyle(
                          fontSize: 20,
                          color: kSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
