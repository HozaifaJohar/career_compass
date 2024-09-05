

import 'package:career_compass/services/company/prem_req.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/buttom.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key});

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  RangeValues values = const RangeValues(0.1, 0.5);
  double currentValue = 1;
  @override
  Widget build(BuildContext context) {
    RangeLabels labels =
        RangeLabels(values.start.toString(), values.end.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'P R E M I U M  A C C O U N T',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              AppColors.mainColor,
              Color.fromARGB(255, 67, 87, 202),
            ]),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            const SizedBox(
              height: 100,
              width: 100,
              child: Image(image: AssetImage('images/vector.png')),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Select the value you wnat to be a premuim',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),
            Slider(
                divisions: 10,
                value: currentValue,
                max: 10,
                label: currentValue.round().toString(),
                onChanged: (double newValues) {
                  setState(() {
                    currentValue = newValues;
                  });
                }),
            const SizedBox(
              height: 40,
            ),
            customButton(
                tap: () {
                  PremService().postPrem(currentValue.round());
                },
                text: 'Confirm',
                context: context,
                width: 200),
          ],
        ),
      )),
    );
  }
}
