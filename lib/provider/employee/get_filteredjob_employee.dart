import 'package:career_compass/models/employee/job_employee.dart';
import 'package:career_compass/services/employee/employee_requests/get_filtered_jobs.dart';
import 'package:flutter/material.dart';

class FilteredJobs extends ChangeNotifier {
  final _jobsService = JobsService();
  List<JobEmployee> _jobs = [];
  List<JobEmployee> get jobs => _jobs;
  bool isLoading = false;

  Future<void> getFilterJobs() async {
    isLoading = true;
    notifyListeners();
    print('adsgdsaf${statics} ');
    print('The filterd salary is => $salary');
    try {
      final response = await _jobsService.getJobs(
        gender: gender,
        salary: salary,
        companyName: companyName,
        statics: statics,
        subCategories: subCategories,
      );
      _jobs = response;
    } catch (error) {
      print(error);
    }

    isLoading = false;
    notifyListeners();
  }

  /////////////////////////////////
  String? gender;
  String? companyName;
  int? experience;
  int? salary;
  List<int>? statics;
  List<int>? subCategories;

  void setFilters({
    String? gender,
    String? companyName,
    int? experience,
    int? salary,
    List<int>? statics,
    List<int>? subCategories,
  }) {
    this.gender = gender;
    this.companyName = companyName;
    this.experience = experience;
    this.salary = salary;
    this.statics = statics;
    this.subCategories = subCategories;
    notifyListeners();
  }

  void resetFilters() {
    gender = null;
    companyName = null;
    experience = null;
    salary = null;
    statics = null;
    subCategories = null;
    notifyListeners();
  }
}
