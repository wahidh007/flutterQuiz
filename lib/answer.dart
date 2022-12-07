import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  Function reponseFunc;
  String answer;
  int pScore;

  Answer(this.reponseFunc, this.answer, this.pScore);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          reponseFunc(pScore);
        },
        child: Text(
          answer,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
