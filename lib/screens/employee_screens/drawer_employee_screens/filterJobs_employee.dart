import 'package:career_compass/models/static.dart';
import 'package:career_compass/provider/employee/filter_screen_helper.dart';
import 'package:career_compass/provider/employee/get_filteredjob_employee.dart';
import 'package:career_compass/provider/employee/register_screen_helper.dart';
import 'package:career_compass/provider/employee/onTap_nav_employee.dart';
import 'package:career_compass/screens/company_screens/nav_company_screens.dart';
import 'package:career_compass/screens/employee_screens/filter_employee_screen.dart';
import 'package:career_compass/screens/employee_screens/nav_employee_screen.dart';
import 'package:career_compass/services/employee/useful/useful.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/buttomSheet_filter/buttom_sheet_categories.dart';
import 'package:career_compass/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../widgets/buttomSheet_filter/buttom_sheet_subcategories.dart';

class FilterJobsEmployee extends StatefulWidget {
  const FilterJobsEmployee({super.key});

  @override
  State<FilterJobsEmployee> createState() => _FilterJobsEmployeeState();
}

class _FilterJobsEmployeeState extends State<FilterJobsEmployee> {
  final gender = ['male', 'female'];
  String? _selectedgender;
  final TextEditingController _salary = TextEditingController();
  final TextEditingController _experience = TextEditingController();
  final TextEditingController _companyName = TextEditingController();
  late Future<List<Category>> staticCategories;
  late Future<List<Category>> staticTypes;
  late Future<List<Category>> staticLevels;
  @override
  void initState() {
    staticCategories =
        UseFul().getAllStatic().then((value) => value.categories);
    super.initState();
    staticTypes = UseFul().getAllStatic().then((value) => value.jobTypes);
    staticLevels = UseFul().getAllStatic().then((value) => value.levels);
  }

  @override
  void dispose() {
    _salary.dispose();
    _companyName.dispose();
    _experience.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final provider = Provider.of<FilterHelper>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        backgroundColor: AppColors.mainColor,
        title: const Text(
          'FILTER\n J O B S',
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
            preferredSize: Size.fromHeight(40), child: SizedBox()),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight / 18,
              ),
              ContainerAndSheetCategories(
                title: 'Job Role',
                subtitle: 'enter role',
                staticList: staticCategories,
              ),
              ContainerAndSheetCategories(
                title: 'Job Level',
                subtitle: 'enter level',
                staticList: staticLevels,
              ),
              ContainerAndSheetCategories(
                title: 'Job Type',
                subtitle: 'enter type',
                staticList: staticTypes,
              ),
              ContainerAndSheetSubcategories(
                title: 'Job Qualification',
                subtitle: 'enter Role(s) before entering Qualification',
                qualificationList: UseFul().getThierSubCategory(
                    Provider.of<FilterHelper>(context).rolesId.join(',')),
              ),
              CustomTextField(
                title: 'enter number of experience year(s)',
                keyboadType: TextInputType.number,
                inputFormate: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                maxLines: 1,
                controller: _experience,
                border: 10,
                borderColor: AppColors.mainColor,
              ),
              CustomTextField(
                title: 'enter salary',
                keyboadType: TextInputType.number,
                inputFormate: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                maxLines: 1,
                controller: _salary,
                border: 10,
                borderColor: AppColors.mainColor,
              ),
              CustomTextField(
                title: 'enter company name',
                controller: _companyName,
                maxLines: 1,
                border: 10,
                borderColor: AppColors.mainColor,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: DropdownButton(
                  hint: const Text('Select Gender'),
                  isExpanded: true,
                  value: _selectedgender,
                  items: gender
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      _selectedgender = val as String;
                    });
                  },
                  icon: const Icon(Icons.person_rounded),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () async {
                  Provider.of<FilteredJobs>(context, listen: false).setFilters(
                    salary: int.tryParse(_salary.text),
                    gender: _selectedgender,
                    companyName: _companyName.text,
                    experience: int.tryParse(_experience.text),
                    statics: provider.ides,
                    subCategories: provider.subIdes,
                  );
                  Provider.of<OntapNavigationEmployee>(context, listen: false)
                      .newIndex(0);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NavigationEmployeeScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(50)),
                  child: const Center(
                    child: Text(
                      'Go',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
