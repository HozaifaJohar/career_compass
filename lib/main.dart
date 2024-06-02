import 'package:career_compass/provider/onTap_nav_company.dart';
import 'package:career_compass/provider/onTap_nav_employee.dart';
import 'package:career_compass/provider/type_provider.dart';
import 'package:career_compass/screens/company_screens/add_job.dart';
import 'package:career_compass/screens/company_screens/companyjob_details.dart';
import 'package:career_compass/screens/company_screens/drawer_company_screens/changeInfo_company.dart';
import 'package:career_compass/screens/company_screens/drawer_company_screens/changePassword_company.dart';
import 'package:career_compass/screens/company_screens/drawer_company_screens/uploadLogo_company.dart';
import 'package:career_compass/screens/company_screens/nav_company_screens.dart';
import 'package:career_compass/screens/company_screens/otp_company.dart';
import 'package:career_compass/screens/employee_screens/drawer_employee_screens/appliedJobs_employee.dart';
import 'package:career_compass/screens/employee_screens/drawer_employee_screens/changeInfo_employee.dart';
import 'package:career_compass/screens/employee_screens/drawer_employee_screens/changePassword_employee.dart';
import 'package:career_compass/screens/employee_screens/drawer_employee_screens/filterJobs_employee.dart';
import 'package:career_compass/screens/employee_screens/drawer_employee_screens/uploadCv.dart';
import 'package:career_compass/screens/employee_screens/drawer_employee_screens/uploadPhoto_employee.dart';
import 'package:career_compass/screens/employee_screens/employee_information.dart';
import 'package:career_compass/screens/employee_screens/home_employee.dart';
import 'package:career_compass/screens/employee_screens/jobemplyee_details.dart';
import 'package:career_compass/screens/employee_screens/nav_employee_screen.dart';
import 'package:career_compass/screens/employee_screens/otp_employy.dart';
import 'package:career_compass/screens/employee_screens/register_employee.dart';
import 'package:career_compass/screens/login.dart';
import 'package:career_compass/screens/company_screens/home_company.dart';
import 'package:career_compass/screens/company_screens/register_company.dart';

import 'package:career_compass/screens/register.dart';
import 'package:career_compass/screens/start.dart';
import 'package:career_compass/services/employee/register_employee_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/splash.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => RegisterEmployeeSrevice()),
      ChangeNotifierProvider(create: (context) => TypeProvider()),
      ChangeNotifierProvider(create: (context) => OntapNavigationCompany()),
      ChangeNotifierProvider(create: (context) => OntapNavigationEmployee())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: StartScreen(),
      routes: {
        '/start_screen': (context) => StartScreen(),
        'register_screen': (context) => RegisterScreen(),
        '/login_screen': (context) => const LoginScreen(),
        'otp_company': (context) => const OtpCompany(),
        //'/splash_screen': (context) => const SplashScreen(),
        //screens for company section
        '/compay_jobdetails': (context) => const CompanyJobDetails(),
        '/changePassword_company': (context) => const ChangePasswordCompany(),
        '/register_company': (context) => const ResisterCompanyScreen(),
        '/home_company': (context) => const HomePageCompany(),
        '/add_job': (context) => const AddJob(),
        '/navigation_company': (context) => const NavigationCompanyScreen(),
        '/changeInfo_company': (context) => const ChangeInformationCompany(),
        '/upload_logo': (context) => const UploadLogo(),
        //screens for employee section
        // '/register_employee': (context) => const RegisterEmployeeScreen(),
        'otp_employee': (context) => const OtpEmployee(),
        '/home_employee': (context) => const HomePageEmployee(),
        '/scientific_information': (context) => const ScientificInformation(),
        '/navigation_employee': (context) => const NavigationEmployeeScreen(),
        '/filterJobs_employee': (context) => const FilterJobsEmployee(),
        '/changeInfo_employee': (context) => const ChangeInformationEmployee(),
        '/changePassword_employee': (context) => const ChangePasswordEmployee(),
        '/appliedJobs_employee': (context) => const AppliedJobsEmployee(),
        '/uploadPhoto_employee': (context) => const UploadPhotoEmployee(),
        '/upload_cv': (context) => const UploadCv(),

        '/employee_jobdetails': (context) => const EmployeJobDetails(),
      },
    );
  }
}
