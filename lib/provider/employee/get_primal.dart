import 'package:career_compass/models/employee/job_employee.dart';
import 'package:career_compass/services/employee/employee_requests/get_primal_jobs.dart';
import 'package:flutter/foundation.dart';

class Primal extends ChangeNotifier {
  final _jobService = PrimalService();
  List<JobEmployee> _jobs = [];
  List<JobEmployee> get jobs => _jobs;
  bool isLoading = false;
  Future<void> getJobs() async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await _jobService.getPrimal();
      _jobs = response;
      print(response);
    } catch (error) {
      print(error);
    }

    isLoading = false;
    notifyListeners();
  }
}
