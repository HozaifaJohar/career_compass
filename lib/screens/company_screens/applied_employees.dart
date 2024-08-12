import 'dart:ui';
import 'package:career_compass/models/applied_emp.dart';
import 'package:career_compass/screens/company_screens/emp_details.dart';
import 'package:career_compass/screens/company_screens/otp_company.dart';
import 'package:career_compass/screens/start.dart';
import 'package:career_compass/services/company/get_applied.dart';
import 'package:career_compass/widgets/notificationCard_company.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AppliedEmployeesSecreen extends StatefulWidget {
  int id;
  AppliedEmployeesSecreen({super.key, required this.id});

  @override
  State<AppliedEmployeesSecreen> createState() =>
      _AppliedEmployeesSecreenState();
}

class _AppliedEmployeesSecreenState extends State<AppliedEmployeesSecreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.pink,
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
            future: GetEmployees().getApplied(widget.id),
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
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return EmployeeDetails(emp: emp[index]);
                          }));
                        },
                        child: NotificationCardCompany(
                          tiltle: emp[index].employee.name,
                          // url: emp[index].employee.image
                        ),
                      );
                    },
                  ),
                );
              } else if (snapshot.data == 'no data') {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: Image(image: AssetImage('images/emp.png')),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'No employees applying for this job',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
