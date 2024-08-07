import 'dart:ui';

import 'package:career_compass/models/applied_emp.dart';
import 'package:career_compass/services/company/get_applied.dart';
import 'package:career_compass/widgets/notificationCard_company.dart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AcceptedEmpSec extends StatelessWidget {
  int id;
   AcceptedEmpSec({super.key,required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Applied Employees'),
        centerTitle: true,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white.withAlpha(200),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: FutureBuilder(
          future: GetEmployees().getallApplied(id),
          builder: (context, snapshot) {
            if (snapshot.data is List) {
              List<AppliedEmployee> emp = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  itemCount: emp.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return EmployeeDetails(emp: emp[index]);
                        // }));
                      },
                      child: NotificationCardCompany(
                          tiltle: emp[index].employee.name,
                          subTitle: 'Engineer'),
                    );
                  },
                ),
              );
            } else if (snapshot.data == 'no data') {
              return const Center(
                child: Text('No Employee Accepted'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
