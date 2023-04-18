import 'package:flutter/material.dart';
import 'question.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Icon check = Icon(
    Icons.check,
    color: Colors.green,
  );

  Icon close = Icon(
    Icons.close,
    color: Colors.red,
  );

  List<Icon> scoreKeeper = [];
  List<Question> questions = [
    Question(question: 'You can lead a cow down stairs but not up stairs.', answer: false),
    Question(question: 'Approximately one quarter of human bones are in the feet.', answer: true),
    Question(question: 'A slug\'s blood is green.', answer: true)
  ];

  int questionIndex = 0;

  void answerTrue() {
    Icon toAdd = close;
    if(questions[questionIndex].answer) {
      toAdd = check;
    }
    setState(() {
      if (scoreKeeper.length < questions.length) {
        scoreKeeper.add(toAdd);
      }
      if (questionIndex < 2) {
        questionIndex += 1;
      }
    });
  }

  void answerFalse() {
    Icon toAdd = close;
    if(!questions[questionIndex].answer) {
      toAdd = check;
    }
    setState(() {
      if (scoreKeeper.length < questions.length) {
        scoreKeeper.add(toAdd);
      }
      if (questionIndex < 2) {
        questionIndex += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[questionIndex].question,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.green),
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                answerTrue();
                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red),
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                answerFalse();
                //The user picked false.
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper.toList(),
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/