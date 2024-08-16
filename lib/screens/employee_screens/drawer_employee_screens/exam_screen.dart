import 'package:career_compass/models/employee/exam_model.dart';
import 'package:career_compass/services/employee/employee_requests/exam/get_exam.dart';
import 'package:career_compass/services/employee/employee_requests/exam/post_exam.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  final int id;
  const QuizScreen({super.key, required this.id});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late Future<List<Exam>> futureExams;
  int currentIndex = 0;
  String? selectedAnswer;
  List<String?> userAnswers = [];
  int score = 0;
  bool isQuizCompleted = false; // New variable to track quiz completion

  @override
  void initState() {
    super.initState();
    futureExams = ApplyExam().applyExam(widget.id);
  }

  void nextQuestion() {
    if (currentIndex < 11) {
      setState(() {
        userAnswers.add(selectedAnswer);
        currentIndex++;
        selectedAnswer = null;
      });
    } else {
      _submitQuiz();
    }
  }

  void _submitQuiz() async {
    var res = await ApplyToExam().sendResult(widget.id, score);
    setState(() {
      isQuizCompleted = true; // Mark the quiz as completed
    });
    print("Score: $score");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: FutureBuilder<List<Exam>>(
          future: futureExams,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }
            if (snapshot.hasData) {
              List<Exam> examList = snapshot.data!;

              if (isQuizCompleted) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "You finished the exam!",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Back'))
                  ],
                ));
              }

              if (currentIndex >= examList.length) {
                return const Center(
                    child: Text(
                  "No  questions available",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ));
              }

              Exam currentExam = examList[currentIndex];

              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Simple Quiz To Become Hero",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Text(
                    '${currentExam.question}?',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  ...['a', 'b', 'c', 'd'].map((option) {
                    return ListTile(
                      title: Text(
                        '${option.toUpperCase()}: ${currentExam.toJson()[option]}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      leading: Radio<String>(
                        activeColor: AppColors.amber,
                        value: option,
                        groupValue: selectedAnswer,
                        onChanged: (value) {
                          setState(() {
                            selectedAnswer = value;
                            if (selectedAnswer == currentExam.answer) {
                              score++;
                            }
                          });
                        },
                      ),
                    );
                  }),
                  ElevatedButton(
                    onPressed: currentIndex < examList.length - 1
                        ? nextQuestion
                        : _submitQuiz,
                    child: Text(
                        currentIndex < examList.length - 1 ? "Next" : "Submit"),
                  ),
                ],
              );
            }
            return const Center(child: Text("No data available"));
          },
        ),
      ),
    );
  }
}
