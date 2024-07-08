import 'package:flutter/material.dart';

class DetailsContainer extends StatelessWidget {
  String jobTitle;
  DetailsContainer({super.key, required this.jobTitle});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 3,
          color: Colors.white,
        ),
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 3,
          decoration: const BoxDecoration(
            color: Color(0xFF5E72E2),
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(70)),
          ),
          child: Center(
            child: Text(
              jobTitle,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
