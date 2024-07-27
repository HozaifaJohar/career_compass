import 'package:career_compass/core/shared_preferences.dart';
import 'package:career_compass/models/static.dart';
import 'package:career_compass/models/subcatygory.dart';
import 'package:career_compass/provider/company/counter.dart';
import 'package:career_compass/provider/company/job_helper.dart';
import 'package:career_compass/services/company/add_job.dart';
import 'package:career_compass/services/company/get_static.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/int_fieled.dart';
import 'package:career_compass/widgets/job/addQual.dart';
import 'package:career_compass/widgets/job/addcategory_sheet.dart';
import 'package:career_compass/widgets/buttom.dart';
import 'package:career_compass/widgets/counter.dart';
import 'package:career_compass/widgets/flash_message.dart';
import 'package:career_compass/widgets/job/addstatic.dart';
import 'package:career_compass/widgets/textfield.dart';
import 'package:career_compass/widgets/waves.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:career_compass/models/static.dart';
import 'package:provider/provider.dart';

class AddJob extends StatefulWidget {
  const AddJob({super.key});

  @override
  State<AddJob> createState() => _AddJobState();
}

class _AddJobState extends State<AddJob> {
  final TextEditingController title = TextEditingController();
  final TextEditingController desc = TextEditingController();
  final TextEditingController salary = TextEditingController();
  late Future<List<Category>> staticCategories;
  late Future<List<Category>> staticLevel;
  late Future<List<Category>> staticType;
  late Future<Static> _futureStatic;
  late Future<List<Subcategory>> _subCatygory;

  String jobRoleSelected = '';
  String jobLevelSelected = '';
  String jobTypeSelected = '';
  String genderSelected = '';

  List<String> gender = ['male', 'female', 'No Preferance'];

  @override
  void initState() {
    super.initState();
    staticCategories =
        GetStatic().getAllStatic().then((value) => value.categories);
    staticLevel = GetStatic().getAllStatic().then((value) => value.levels);
    staticType = GetStatic().getAllStatic().then((value) => value.jobTypes);
    _futureStatic = GetStatic().getAllStatic();
    _subCatygory = GetStatic().getSubcategory();
  }

  @override
  Widget build(BuildContext context) {
    final helper = Provider.of<JobHelper>(context, listen: false);
    final counter = Provider.of<Counter>(context);
    int LevelId = helper.idLevel;
    int typeId = helper.idtype;
    List<int> selectedJobId = helper.selectedJobRoleId;
    List<int> selectedQualId = helper.selectedJobQualId;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      validateMessage: 'title is required',
                      title: 'Job Title',
                      hint: 'Job hint',
                      controller: title,
                      maxLines: 1,
                      border: 10,
                      borderColor: AppColors.amber,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ButtomSheetWithList(staticList: staticCategories),
                    const SizedBox(
                      height: 20,
                    ),
                    AddStatic(
                      staticList: staticLevel,
                      title: 'Level',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AddStatic(
                      staticList: staticType,
                      title: 'Type',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AddQual(subCate: _subCatygory),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            shape: const BeveledRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50))),
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 222, 219, 219),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(50),
                                        topRight: Radius.circular(50))),
                                child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: ListView.builder(
                                        itemCount: gender.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            title: Text(
                                              gender[index],
                                              textAlign: TextAlign.center,
                                            ),
                                            onTap: () {
                                              setState(() {
                                                genderSelected = gender[index];
                                                Navigator.pop(context);
                                              });
                                            },
                                          );
                                        })),
                              );
                            });
                      },
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 238, 230, 230),
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          title: const Text(
                            'Gender',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(genderSelected),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomCounterContainer(
                        title: 'Work Hour',
                        count: counter.countHour,
                        counter: counter,
                        add: counter.addHour,
                        sub: counter.subHour),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomCounterContainer(
                        title: 'Experience year',
                        count: counter.countExper,
                        counter: counter,
                        add: counter.addExpr,
                        sub: counter.subExpr),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomCounterContainer(
                        title: 'Max Employees',
                        count: counter.countMax,
                        counter: counter,
                        add: counter.addMax,
                        sub: counter.subMax),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      validateMessage: 'description is required',
                      title: 'Description',
                      hint: 'desription',
                      controller: desc,
                      maxLines: 3,
                      border: 10,
                      borderColor: AppColors.amber,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    IntegerTextField(controller: salary),
                    const SizedBox(
                      height: 20,
                    ),
                    Consumer<AddJobServices>(builder: (context, job, child) {
                      return customButton(
                        text: 'Add job',
                        tap: () {
                          if (helper.isEmpty() ||
                              title.text.isEmpty ||
                              desc.text.isEmpty ||
                              genderSelected.isEmpty ||
                              salary.text.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              elevation: 0,
                              content: FlashMessage(
                                errorText:
                                    "All Fields Is required, please fill all",
                              ),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                            ));
                          } else {
                            job.addJob(
                                title.text,
                                typeId,
                                LevelId,
                                selectedJobId,
                                selectedQualId,
                                desc.text,
                                int.parse(salary.text),
                                counter.countHour,
                                counter.countExper,
                                counter.countMax,
                                genderSelected);
                          }
                        },
                        context: context,
                      );
                    })
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
