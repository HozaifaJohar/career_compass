import 'package:career_compass/core/shared_preferences.dart';
import 'package:career_compass/nexttest.dart';
import 'package:career_compass/provider/company/counter.dart';
import 'package:career_compass/provider/employee/filter_screen_helper.dart';
import 'package:career_compass/provider/employee/get_alljobs.dart';
import 'package:career_compass/provider/employee/get_filteredjob_employee.dart';
import 'package:career_compass/provider/employee/get_primal.dart';
import 'package:career_compass/provider/employee/info_helper.dart';
import 'package:career_compass/provider/employee/register_screen_helper.dart';
import 'package:career_compass/provider/company/job_helper.dart';
import 'package:career_compass/provider/company/jobs_provider.dart';
import 'package:career_compass/provider/company/onTap_nav_company.dart';
import 'package:career_compass/provider/employee/onTap_nav_employee.dart';
import 'package:career_compass/provider/type_provider.dart';
import 'package:career_compass/screens/company_screens/add_job.dart';
import 'package:career_compass/screens/company_screens/drawer_company_screens/changeInfo_company.dart';
import 'package:career_compass/screens/company_screens/drawer_company_screens/uploadLogo_company.dart';
import 'package:career_compass/screens/company_screens/nav_company_screens.dart';
import 'package:career_compass/screens/employee_screens/drawer_employee_screens/appliedJobs_employee.dart';
import 'package:career_compass/screens/employee_screens/drawer_employee_screens/changeInfo_employee.dart';
import 'package:career_compass/screens/employee_screens/drawer_employee_screens/changePassword_employee.dart';
import 'package:career_compass/screens/employee_screens/drawer_employee_screens/filterJobs_employee.dart';
import 'package:career_compass/screens/employee_screens/drawer_employee_screens/uploadCv.dart';
import 'package:career_compass/screens/employee_screens/drawer_employee_screens/uploadPhoto_employee.dart';
import 'package:career_compass/screens/employee_screens/scientific_information.dart';
import 'package:career_compass/screens/employee_screens/home_employee.dart';
import 'package:career_compass/screens/employee_screens/nav_employee_screen.dart';
import 'package:career_compass/screens/login.dart';
import 'package:career_compass/screens/company_screens/home_company.dart';
import 'package:career_compass/screens/register.dart';
import 'package:career_compass/screens/start.dart';
import 'package:career_compass/services/company/activateotp_company.dart';
import 'package:career_compass/services/company/add_job.dart';
import 'package:career_compass/services/company/auth_company.dart';
import 'package:career_compass/services/company/patch_emp.dart';
import 'package:career_compass/services/company/upload_logo.dart';
import 'package:career_compass/services/employee/employee_auth/activation_employee.dart';
import 'package:career_compass/services/employee/employee_auth/login_employee_service.dart';
import 'package:career_compass/services/employee/employee_auth/register_employee_service.dart';
import 'package:career_compass/services/employee/employee_auth/resendCode_employee.dart';
import 'package:career_compass/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';

void main() async {
  //this two lines to call init() function before run the app...
  WidgetsFlutterBinding.ensureInitialized();
  await CashMemory.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ResendCodeEmployeeService()),
      ChangeNotifierProvider(create: (context) => ResendCodeEmployeeService()),
      ChangeNotifierProvider(create: (context) => ActivationEmployeeService()),
      ChangeNotifierProvider(create: (context) => LogInEmployeeService()),
      ChangeNotifierProvider(create: (context) => RegisterEmployeeSrevice()),
      ChangeNotifierProvider(create: (context) => TypeProvider()),
      ChangeNotifierProvider(create: (context) => OntapNavigationCompany()),
      ChangeNotifierProvider(create: (context) => OntapNavigationEmployee()),
      ChangeNotifierProvider(create: (context) => AuthCompany()),
      ChangeNotifierProvider(create: (context) => ActivicationCode()),
      ChangeNotifierProvider(create: (context) => RegisterHelper()),
      ChangeNotifierProvider(create: (context) => Counter()),
      ChangeNotifierProvider(create: (context) => AddJobServices()),
      ChangeNotifierProvider(create: (context) => FileUploader()),
      ChangeNotifierProvider(create: (context) => JobProvider()),
      ChangeNotifierProvider(create: (context) => FilteredJobs()),
      ChangeNotifierProvider(create: (context) => JobHelper()),
      ChangeNotifierProvider(create: (context) => FilterHelper()),
      ChangeNotifierProvider(create: (context) => Alljobs()),
      ChangeNotifierProvider(create: (context) => Primal()),
      ChangeNotifierProvider(create: (context) => InfoHelper()),
      ChangeNotifierProvider(create: (context) => PatchEmp()),
    ],
    child: Phoenix(child: const MyApp()),
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
      home: const StartScreen(),
      //initialRoute: ,
      routes: {
        '/start_screen': (context) => const StartScreen(),
        'register_screen': (context) => RegisterScreen(),
        '/login_screen': (context) => LoginScreen(),
        // 'otp_company': (context) =>  OtpCompany(),
        //'/splash_screen': (context) => const SplashScreen(),

        //screens for company section
        // '/compay_jobdetails': (context) => const CompanyJobDetails(),
        //'/changePassword_company': (context) => const ChangePasswordCompany(),
        // '/register_company': (context) =>  ResisterCompanyScreen(),
        '/home_company': (context) => const HomePageCompany(),
        '/add_job': (context) => const AddJob(),
        '/navigation_company': (context) => const NavigationCompanyScreen(),
        '/changeInfo_company': (context) => const ChangeInformationCompany(),
        '/upload_logo': (context) => const UploadLogo(),

        //screens for employee section
        // '/register_employee': (context) => const RegisterEmployeeScreen(),
        // '/otp_employee': (context) => const OtpEmployee(),
        '/home_employee': (context) => const HomePageEmployee(),
        '/scientific_information': (context) => const ScientificInformation(),
        '/navigation_employee': (context) => const NavigationEmployeeScreen(),
        '/filterJobs_employee': (context) => const FilterJobsEmployee(),
        '/changeInfo_employee': (context) => const ChangeInformationEmployee(),
        '/changePassword_employee': (context) => const ChangePasswordEmployee(),
        '/appliedJobs_employee': (context) => const AppliedJobsEmployee(),
        '/uploadPhoto_employee': (context) => const UploadPhotoEmployee(),
        '/upload_cv': (context) => const UploadCv(),

        //'/employee_jobdetails': (context) =>  EmployeJobDetails(),
      },
    );
  }
}
