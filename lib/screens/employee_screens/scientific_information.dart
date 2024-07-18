import 'package:career_compass/constant/static_lists.dart';
import 'package:career_compass/core/shared_preferences.dart';
import 'package:career_compass/models/qual.dart';
import 'package:career_compass/models/static.dart';
import 'package:career_compass/provider/filter_screen_helper.dart';
import 'package:career_compass/services/employee/employee_requests/set_education&experience.dart';
import 'package:career_compass/services/employee/employee_requests/set_statics.dart';
import 'package:career_compass/services/employee/employee_requests/set_subcategories.dart';
import 'package:career_compass/services/employee/useful/useful.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/buttomSheets/buttom_sheet_categories.dart';
import 'package:career_compass/widgets/buttomSheets/buttom_sheet_constitems.dart';
import 'package:career_compass/widgets/buttomSheets/buttom_sheet_subcategories.dart';
import 'package:career_compass/widgets/flash_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScientificInformation extends StatefulWidget {
  const ScientificInformation({super.key});

  @override
  State<ScientificInformation> createState() => _ScientificInformationState();
}

class _ScientificInformationState extends State<ScientificInformation> {
  late Future<List<Category>> staticCategories;
  late Future<List<Category>> staticTypes;
  late Future<List<Category>> staticLevels;
  late Future<List<Qualification>> staticQualifications;
  String token = CashMemory().getCashData(key: 'accessToken');

  @override
  void initState() {
    super.initState();
    staticCategories =
        UseFul().getAllStatic().then((value) => value.categories);
    staticTypes = UseFul().getAllStatic().then((value) => value.jobTypes);
    staticLevels = UseFul().getAllStatic().then((value) => value.levels);
  }

  @override
  Widget build(BuildContext context) {
    // List<Map<String, String>> categories = Provider.of<FilterScreenHelper>(
    //   context,
    //   listen: false,
    // ).getCategories();
    // List<Map<String, String>> subCategories = Provider.of<FilterScreenHelper>(
    //   context,
    //   listen: false,
    // ).getSubCategories();
    // Map<String, String> items = Provider.of<FilterScreenHelper>(
    //   context,
    //   listen: false,
    // ).constItems();
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          elevation: 15,
          backgroundColor: AppColors.mainColor,
          title: const Text(
            'S C I E N T I F I C\n I N F O R M A T I O N',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(90),
            bottomRight: Radius.circular(90),
          )),
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(65), child: SizedBox()),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight / 40,
                ),
                ContainerAndSheetCategories(
                  title: 'Job Role',
                  subtitle: 'Required',
                  staticList: staticCategories,
                ),
                const SizedBox(
                  height: 20,
                ),
                ContainerAndSheetCategories(
                  title: 'Job Level',
                  subtitle: 'Optional',
                  staticList: staticLevels,
                ),
                const SizedBox(
                  height: 20,
                ),
                ContainerAndSheetCategories(
                  title: 'Job Type',
                  subtitle: 'Optional',
                  staticList: staticTypes,
                ),
                const SizedBox(
                  height: 20,
                ),
                ContainerAndSheetSubcategories(
                  title: 'Job Qualification',
                  subtitle: 'Required',
                  qualificationList: UseFul().getThierSubCategory(
                      Provider.of<FilterScreenHelper>(context)
                          .selectedJobId
                          .join(',')),
                ),
                const SizedBox(
                  height: 20,
                ),
                ContainerAndSheetConstants(
                  title: 'Experience',
                  staticList: StaticLists.experience,
                ),
                const SizedBox(
                  height: 20,
                ),
                ContainerAndSheetConstants(
                  title: 'Education',
                  staticList: StaticLists.education,
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    if (Provider.of<FilterScreenHelper>(context, listen: false)
                        .filterScreenValidation()) {
                      SetStatics().post(
                        allCategories: Provider.of<FilterScreenHelper>(
                          context,
                          listen: false,
                        ).getCategories(),
                        accessToken:
                            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywibmFtZSI6ImltYWQiLCJlbWFpbCI6ImltYWRmZmZmQGdtYWlsLmNvbSIsImdlbmRlciI6Im1hbGUiLCJpYXQiOjE3MjAwMDM4NTQsImV4cCI6MTcyMDYwODY1NH0.kCD5Ae5cIxkTcj3vN0OOS8K3-WM_k7EusGpBOT5MSSQ',
                      );
                      SubCategories().post(
                        allSubCategories: Provider.of<FilterScreenHelper>(
                          context,
                          listen: false,
                        ).getSubCategories(),
                        accessToken:
                            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywibmFtZSI6ImltYWQiLCJlbWFpbCI6ImltYWRmZmZmQGdtYWlsLmNvbSIsImdlbmRlciI6Im1hbGUiLCJpYXQiOjE3MjAwMDM4NTQsImV4cCI6MTcyMDYwODY1NH0.kCD5Ae5cIxkTcj3vN0OOS8K3-WM_k7EusGpBOT5MSSQ',
                      );
                      SetEducationAndExeperience().post(
                        items: Provider.of<FilterScreenHelper>(
                          context,
                          listen: false,
                        ).constItems(),
                        accessToken:
                            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywibmFtZSI6ImltYWQiLCJlbWFpbCI6ImltYWRmZmZmQGdtYWlsLmNvbSIsImdlbmRlciI6Im1hbGUiLCJpYXQiOjE3MjAwMDM4NTQsImV4cCI6MTcyMDYwODY1NH0.kCD5Ae5cIxkTcj3vN0OOS8K3-WM_k7EusGpBOT5MSSQ',
                      );
                      Navigator.pushNamed(context, '/navigation_employee');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        elevation: 0,
                        content: FlashMessage(
                          errorText: "All Fields Is required, please fill all",
                        ),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                      ));
                    }
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: const Center(
                      child: Text(
                        'Complete',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
