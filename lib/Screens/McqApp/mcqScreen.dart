import 'package:flutter/material.dart';
import 'mcq.dart';

class myMCQScreen extends StatefulWidget {
  myMCQScreen({super.key});

  @override
  State<myMCQScreen> createState() => _myMCQScreenState();
}

class _myMCQScreenState extends State<myMCQScreen> {
  int _index = 0;
  String? userAnswer;
  int Score = 0;
  List<String> answers = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F3FF),
      appBar: AppBar(
        title: Text(
          "My MCQ App",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        elevation: 20,
      ),
      // body: QuestionView(),
      body: _index <= 9 ? QuestionView() : ResultView(),
    );
  }

  Widget ResultView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          Card(
            color: Colors.blue,
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Your Score is $Score",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _index = 0;
                Score = 0;
                answers.clear();
              });
            },
            child: Text("Reset", style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }

  Widget QuestionView() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Q)${_index + 1}: ${MCQ.mcqs[_index].question}",
            style: TextStyle(fontSize: 20),
          ),
          Row(
            children: [
              Radio(
                value: MCQ.mcqs[_index].option1,
                groupValue: userAnswer,
                onChanged: (String? val) {
                  setState(() {
                    userAnswer = val!;
                  });
                },
              ),
              Text(
                "${MCQ.mcqs[_index].option1}",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Row(
            children: [
              Radio(
                value: MCQ.mcqs[_index].option2,
                groupValue: userAnswer,
                onChanged: (String? val) {
                  setState(() {
                    userAnswer = val!;
                  });
                },
              ),
              Text(
                "${MCQ.mcqs[_index].option2}",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Row(
            children: [
              Radio(
                value: MCQ.mcqs[_index].option3,
                groupValue: userAnswer,
                onChanged: (String? val) {
                  setState(() {
                    userAnswer = val!;
                  });
                },
              ),
              Text(
                "${MCQ.mcqs[_index].option3}",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Row(
            spacing: 10,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  if (_index > 0) {
                    setState(() {
                      _index--;
                    });
                  }
                },
                child: Text("Back", style: TextStyle(fontSize: 20)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  if (userAnswer != null) {
                    if (userAnswer == MCQ.mcqs[_index].correctAnswer) {
                      if (answers.contains(userAnswer) == false) {
                        Score += 1;
                        answers.add(userAnswer!);
                      }

                      print(answers);
                    }
                    if (_index < MCQ.mcqs.length) {
                      setState(() {
                        _index++;
                        userAnswer = null;
                      });
                    }
                  }
                },
                child: Text("Next", style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
