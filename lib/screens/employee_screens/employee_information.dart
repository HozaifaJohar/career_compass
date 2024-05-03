import 'package:flutter/material.dart';

class ScientificInformation extends StatefulWidget {
  const ScientificInformation({super.key});

  @override
  State<ScientificInformation> createState() => _ScientificInformationState();
}

class _ScientificInformationState extends State<ScientificInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(child: Text('scientific employee information'),),
    );
  }
}