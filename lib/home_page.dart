import 'package:flutter/material.dart';

import 'answer.dart';
import 'mydrawer.dart';
import 'question.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var questionIndex = 0;
  var score = 0;

  var questions = [
    {
      'questionText': 'Your favorite Car ?',
      'answers': [
        {'answer': 'Porshe', 'score': 3},
        {'answer': 'Ferrari', 'score': 4},
        {'answer': 'Lamborguini', 'score': 4}
      ],
    },
    {
      'questionText': 'Your favorite Color ?',
      'answers': [
        {'answer': 'Red', 'score': 1},
        {'answer': 'blue', 'score': 3},
        {'answer': 'Yellow', 'score': 5},
        {'answer': 'Green', 'score': 2}
      ],
    },
    {
      'questionText': 'Your favorite Pet ?',
      'answers': [
        {'answer': 'Dog', 'score': 1},
        {'answer': 'Cat', 'score': 3},
        {'answer': 'Snake', 'score': 0}
      ],
    },
    {
      'questionText': 'Your favorite Club ?',
      'answers': [
        {'answer': 'Real Madrid', 'score': 20},
        {'answer': 'Barcelone', 'score': 1},
        {'answer': 'Milan AC', 'score': 5}
      ],
    },
  ];

  void questionAnswer(int answerScore) {
    setState(() {
      questionIndex++;
      score += answerScore;
    });

    print('Answer chosen !!!!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: Text('QUIZ App'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.alarm),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            icon: Icon(Icons.arrow_back),
          ),
        ],
      ),
      body: questionIndex < questions.length
          ? Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              child: Column(
                children: [
                  Question(
                    questions[questionIndex]['questionText'].toString(),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  // Answer(
                  //     questionAnswer,
                  //     (questions[questionIndex]['answers'] as List<String>)[0]
                  //         .toString()),
                  // Answer(questionAnswer, 'Answer2'),
                  // Answer(questionAnswer, 'Answer3'),
                  ...(questions[questionIndex]['answers']
                          as List<Map<String, Object>>)
                      .map((answer) {
                    return Answer(questionAnswer, answer['answer'].toString(),
                        answer['score'] as int);
                  }),
                ],
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your Score: ' + this.score.toString(),
                    style: TextStyle(fontSize: 28),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        questionIndex = 0;
                        score = 0;
                      });
                    },
                    child: Text(
                      'Reset',
                      style: TextStyle(fontSize: 28),
                    ),
                  )
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}
