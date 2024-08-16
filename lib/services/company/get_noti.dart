import 'package:career_compass/constant/url.dart';
import 'package:career_compass/core/shared_preferences.dart';

class GetNotification{
  final url = AppString.baseUrl;
  String token = CashMemory().getCashData(key: 'accessToken');
}