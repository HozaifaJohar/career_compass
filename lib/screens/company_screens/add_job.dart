import 'package:career_compass/core/shared_preferences.dart';
import 'package:career_compass/models/static.dart';
import 'package:career_compass/models/subcatygory.dart';
import 'package:career_compass/provider/counter.dart';
import 'package:career_compass/services/company/add_job.dart';
import 'package:career_compass/services/company/get_static.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/buttom.dart';
import 'package:career_compass/widgets/counter.dart';
import 'package:career_compass/widgets/flash_message.dart';
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
    final  TextEditingController title = TextEditingController();
  final  TextEditingController desc = TextEditingController();
   final TextEditingController salary = TextEditingController();
  late Future<Static> _futureStatic;
  late Future<List<Subcategory>> _subCatygory;
  List<String> selectedJobCategoey = [];
  List<String> selectedJobQualification = [];
  List<int> selectedJobId = [];
  List<int> selectedQualId = [];
  int LevelId = 0;
  int typeId = 0;
  int _salary = 0;
  String jobRoleSelected = '';
  String jobLevelSelected = '';
  String jobTypeSelected = '';
  String genderSelected = '';

  List<String> gender = ['male', 'female', 'No Preferance'];

  @override
  void initState() {
    super.initState();
    _futureStatic = GetStatic().getAllStatic();
    _subCatygory = GetStatic().getSubcategory();
  }

  @override
  Widget build(BuildContext context) {

    final counter = Provider.of<Counter>(context);
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Opacity(
                opacity: 0.5,
                child: ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    height: 140,
                    color: AppColors.mainColor,
                  ),
                ),
              ),
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  height: 120,
                  color: AppColors.mainColor,
                ),
              ),
            ],
          ),
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
                                    child: FutureBuilder(
                                        future: _futureStatic,
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            var data = snapshot.data!;
                                            return ListView.builder(
                                                itemCount:
                                                    data.categories.length,
                                                itemBuilder: (context, index) {
                                                  return ListTile(
                                                    title: Text(
                                                      data.categories[index]
                                                          .name,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    trailing:
                                                        selectedJobCategoey
                                                                .contains(data
                                                                    .categories[
                                                                        index]
                                                                    .name)
                                                            ? IconButton(
                                                                icon: const Icon(
                                                                    Icons
                                                                        .close),
                                                                onPressed: () {
                                                                  setState(() {
                                                                    selectedJobId.remove(data
                                                                        .categories[
                                                                            index]
                                                                        .id);
                                                                    selectedJobCategoey.remove(data
                                                                        .categories[
                                                                            index]
                                                                        .name);
                                                                    Navigator.pop(
                                                                        context);
                                                                  });
                                                                },
                                                              )
                                                            : null,
                                                    onTap: () {
                                                      setState(() {
                                                        if (selectedJobCategoey
                                                            .contains(data
                                                                .categories[
                                                                    index]
                                                                .name)) {
                                                          selectedJobId.remove(
                                                              data
                                                                  .categories[
                                                                      index]
                                                                  .id);
                                                          selectedJobCategoey
                                                              .remove(data
                                                                  .categories[
                                                                      index]
                                                                  .name);
                                                        } else {
                                                          selectedJobId.add(data
                                                              .categories[index]
                                                              .id);
                                                          selectedJobCategoey
                                                              .add(data
                                                                  .categories[
                                                                      index]
                                                                  .name);
                                                        }
                                                        Navigator.pop(context);
                                                      });
                                                    },
                                                  );
                                                });
                                          } else {
                                            return const CircularProgressIndicator();
                                          }
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
                              'Job Role',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: selectedJobCategoey.isNotEmpty
                                ? SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        for (final jobTitle
                                            in selectedJobCategoey)
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    252, 235, 232, 232),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(jobTitle),
                                                    const SizedBox(width: 8),
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedJobCategoey
                                                              .remove(jobTitle);
                                                        });
                                                      },
                                                      child: const Icon(
                                                        Icons.close,
                                                        size: 16,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  )
                                : const Text('Select job role(s)'),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ///////////////////////////////////////////////////////////////////////
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
                                    child: FutureBuilder<Static>(
                                        future: _futureStatic,
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            final data = snapshot.data!;
                                            return ListView.builder(
                                                itemCount: data.levels.length,
                                                itemBuilder: (context, index) {
                                                  return ListTile(
                                                    title: Text(
                                                      data.levels[index].name,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    onTap: () {
                                                      setState(() {
                                                        jobLevelSelected = data
                                                            .levels[index].name;
                                                        LevelId = data
                                                            .levels[index].id;
                                                        Navigator.pop(context);
                                                      });
                                                    },
                                                  );
                                                });
                                          } else {
                                            return const Text('nodata');
                                          }
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
                            'Job Level',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(jobLevelSelected),
                        ),
                      ),
                    ),
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
                                    child: FutureBuilder<Static>(
                                        future: _futureStatic,
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            final data = snapshot.data!;
                                            return ListView.builder(
                                                itemCount: data.jobTypes.length,
                                                itemBuilder: (context, index) {
                                                  return ListTile(
                                                    title: Text(
                                                      data.jobTypes[index].name,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    onTap: () {
                                                      setState(() {
                                                        jobTypeSelected = data
                                                            .jobTypes[index]
                                                            .name;
                                                        typeId = data
                                                            .jobTypes[index].id;
                                                        Navigator.pop(context);
                                                      });
                                                    },
                                                  );
                                                });
                                          } else {
                                            return const Text('no data');
                                          }
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
                            'Job Type',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(jobTypeSelected),
                        ),
                      ),
                    ),
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
                                    child: FutureBuilder<List<Subcategory>>(
                                        future: _subCatygory,
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            var data = snapshot.data!;
                                            return ListView.builder(
                                                itemCount: data.length,
                                                itemBuilder: (context, index) {
                                                  return ListTile(
                                                    title: Text(
                                                      data[index].name,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    trailing:
                                                        selectedJobQualification
                                                                .contains(
                                                                    data[index]
                                                                        .name)
                                                            ? IconButton(
                                                                icon: const Icon(
                                                                    Icons
                                                                        .close),
                                                                onPressed: () {
                                                                  setState(() {
                                                                    // selectedJobId.remove(
                                                                    //     data
                                                                    //         .categories[
                                                                    //             index]
                                                                    //         .id);
                                                                    selectedJobQualification
                                                                        .remove(
                                                                            data[index].name);
                                                                    selectedQualId
                                                                        .remove(
                                                                            data[index].id);
                                                                    Navigator.pop(
                                                                        context);
                                                                  });
                                                                },
                                                              )
                                                            : null,
                                                    onTap: () {
                                                      setState(() {
                                                        if (selectedJobQualification
                                                            .contains(
                                                                data[index]
                                                                    .name)) {
                                                          selectedQualId.remove(
                                                              data[index].id);
                                                          selectedJobQualification
                                                              .remove(
                                                                  data[index]
                                                                      .name);
                                                        } else {
                                                          selectedQualId.add(
                                                              data[index].id);
                                                          selectedJobQualification
                                                              .add(data[index]
                                                                  .name);
                                                        }
                                                        Navigator.pop(context);
                                                      });
                                                    },
                                                  );
                                                });
                                          } else {
                                            return const Center(
                                                child: SizedBox(
                                                    child:
                                                        CircularProgressIndicator()));
                                          }
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
                              'Job Qualification',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: selectedJobQualification.isNotEmpty
                                ? SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        for (final jobQualification
                                            in selectedJobQualification)
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    252, 235, 232, 232),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(jobQualification),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  )
                                : const Text('Select job qualifications(s)'),
                          )),
                    ),
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
                    CustomTextField(
                      validateMessage: 'Salary is required',
                      title: 'Salary',
                      hint: 'salary',
                      controller: salary,
                      maxLines: 1,
                      border: 10,
                      borderColor: AppColors.amber,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Consumer<AddJobServices>(builder: (context, job, child) {
                     
                      return customButton(
                          text: 'Add job',
                          tap: () {
                            int s = int.parse(salary.text);
                            job.addJob(
                                title.text,
                                typeId,
                                LevelId,
                                selectedJobId,
                                selectedQualId,
                                desc.text,
                                s,
                                counter.countHour,
                                counter.countExper,
                                counter.countMax,
                                genderSelected);
                          },
                          context: context,
                          );
                    })

                    // GestureDetector(
                    //   onTap: () {
                    //     // CashMemory().daleteCashItem(key: 'accessToken');
                    //     String t = CashMemory().getCashData(key: 'accessToken');
                    //     print(t);
                    //     // print(title.text);
                    //     // print(selectedQualId);
                    //     // print(LevelId);
                    //     // print(typeId);
                    //     int s = int.parse(salary.text);
                    //     // print(s);

                    //     AddJobServices().addJob(
                    //         title.text,
                    //         typeId,
                    //         LevelId,
                    //         selectedJobId,
                    //         selectedQualId,
                    //         desc.text,
                    //         s,
                    //         counter.countHour,
                    //         counter.countExper,
                    //         counter.countMax,
                    //         genderSelected);
                    //   },
                    //   child: Container(
                    //     height: 40,
                    //     width: 140,
                    //     decoration: BoxDecoration(
                    //         gradient: LinearGradient(colors: [
                    //           AppColors.mainColor,
                    //           // Color(0xFF00b4db), // First color
                    //           const Color(0xFF00b3b0),
                    //         ]),
                    //         borderRadius:
                    //             const BorderRadius.all(Radius.circular(20))),
                    //     child: const Center(
                    //         child: Text(
                    //       'Add Job',
                    //       style: TextStyle(color: Colors.white),
                    //     )),
                    //   ),
                    // )
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
