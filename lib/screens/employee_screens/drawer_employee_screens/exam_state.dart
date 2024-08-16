import 'package:career_compass/models/sub_exam.dart';
import 'package:career_compass/screens/employee_screens/drawer_employee_screens/exam_screen.dart';
import 'package:career_compass/services/employee/get_subexam.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/flash_message.dart';
import 'package:flutter/material.dart';

class ExamsState extends StatelessWidget {
  const ExamsState({super.key});

  // Function to determine the color based on certification value
  Color _getCertificationColor(int value) {
    switch (value) {
      case 60:
        return Colors.yellow;
      case 70:
        return Colors.orange;
      case 80:
        return Colors.cyan; // Corrected from "cyne"
      case 90:
        return Colors.blue;
      case 100:
        return Colors.green;
      default:
        return Colors.grey; // Default color for unexpected values
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        backgroundColor: AppColors.mainColor,
        title: const Text(
          'E X A M S F O R Y O U',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        )),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(10), child: SizedBox()),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder<List<SubExam>>(
        future: GetSubExams().getExamState(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      if (data[index].certification == null) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return QuizScreen(
                            id: data[index].id,
                          );
                        }));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            elevation: 0,
                            content: FlashMessage(
                              errorText: 'You have applied for this exam',
                            ),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: 80,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 208, 203, 203),
                              Color.fromARGB(255, 226, 219, 219),
                            ],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Text(
                              'Qualification: ${data[index].name}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 180),
                            data[index].certification == null
                                ? const Icon(
                                    Icons.arrow_circle_right,
                                    color: Colors.green,
                                  )
                                : Text(
                                    '${data[index].certification}',
                                    style: TextStyle(
                                      color: data[index].certification != null
                                          ? _getCertificationColor(
                                              data[index].certification!)
                                          : Colors.grey,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
