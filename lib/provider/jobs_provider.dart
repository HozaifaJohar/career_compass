import 'package:career_compass/models/job.dart';
import 'package:career_compass/services/company/get_companyjob.dart';
import 'package:flutter/foundation.dart';

class JobProvider extends ChangeNotifier {
  
  final jobServices = JobServices();
  bool isLoading = false;
  bool get load => isLoading;
  List<Job> _jobs = [];
  List<Job> get jobs => _jobs;
  Future<void> getJobs() async {
    isLoading = true;
    notifyListeners();
    final response = await jobServices.getAllJob();
    _jobs = response;
    isLoading = false;
    notifyListeners();
    
  }
}
