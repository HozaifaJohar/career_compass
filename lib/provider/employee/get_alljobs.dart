import 'package:career_compass/models/employee/job_employee.dart';
import 'package:career_compass/services/employee/employee_requests/get_all_jobs.dart';
import 'package:flutter/material.dart';

class Alljobs extends ChangeNotifier {
  final _jobsService = AlljobService();
  List<JobEmployee> _jobs = [];
  List<JobEmployee> get jobs => _jobs;
  bool isLoading = false;

  Future<void> getJobs() async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await _jobsService.getJobs();
      _jobs = response;
    } catch (error) {
      print(error);
    }

    isLoading = false;
    notifyListeners();
  }
}
