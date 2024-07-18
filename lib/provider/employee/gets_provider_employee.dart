import 'package:career_compass/models/employee/job_employee.dart';
import 'package:career_compass/services/company/get_companyjob.dart';
import 'package:career_compass/services/employee/employee_requests/get_jobs.dart';
import 'package:flutter/material.dart';

class GetProviderEmployee extends ChangeNotifier {
  final _jobsService = JobsService();
  List<JobEmployee> _jobs = [];
  List<JobEmployee> get jobs => _jobs;
  bool isLoading = false;
  Future<void> getAllJobs() async {
    isLoading = true;
    notifyListeners();

    final response = await _jobsService.getJobs();

    _jobs = response;
    isLoading = false;
    notifyListeners();
  }
}
