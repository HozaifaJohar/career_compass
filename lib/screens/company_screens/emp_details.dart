import 'dart:ui';

import 'package:career_compass/models/applied_emp.dart';
import 'package:career_compass/services/company/patch_emp.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EmployeeDetails extends StatelessWidget {
  AppliedEmployee emp;
  EmployeeDetails({super.key, required this.emp});

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
      body: Center(
        child: IconButton(
            onPressed: () async{
            bool i= await PatchEmp().patchemp(emp.employee.id, emp.job.id);
            },
            icon: Icon(Icons.abc)),
      ),
    );
  }
}
