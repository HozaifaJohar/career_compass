import 'package:career_compass/constant/static_lists.dart';
import 'package:career_compass/models/qual.dart';
import 'package:career_compass/models/static.dart';
import 'package:career_compass/services/employee/useful/useful.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/buttom_sheet_1.dart';
import 'package:career_compass/widgets/buttom_sheet_2.dart';
import 'package:flutter/material.dart';

class ScientificInformation extends StatefulWidget {
  const ScientificInformation({super.key});

  @override
  State<ScientificInformation> createState() => _ScientificInformationState();
}

class _ScientificInformationState extends State<ScientificInformation> {
  late Future<List<Category>> staticCategories;
  late Future<List<Category>> staticTypes;
  late Future<List<Category>> staticLevels;
  //late Future<Static> _futureStatic;
  //late Future<List<Subcategory>> _futureSubCategory;
  //TextEditingController address = TextEditingController();
  // List<String> selectedJobCategoey = [];

  List<String> selectedJobQualification = [];
  List<int> selectedJobId = [];

  @override
  void initState() {
    super.initState();
    //_futureStatic = UseFul().getAllStatic();
    staticCategories =
        UseFul().getAllStatic().then((value) => value.categories);
    staticTypes = UseFul().getAllStatic().then((value) => value.jobTypes);
    staticLevels = UseFul().getAllStatic().then((value) => value.levels);
    // _futuresubcategory = GetStaticForEmmployee().getSubcategory(selectedJobId);
  }

  @override
  Widget build(BuildContext context) {
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
                ContainerAndSheetTypeOne(
                  title: 'Job Role',
                  subtitle: 'Select job role(s)',
                  staticList: staticCategories,
                ),
                const SizedBox(
                  height: 20,
                ),
                ContainerAndSheetTypeOne(
                  title: 'Job Level',
                  subtitle: 'Select job level(s)',
                  staticList: staticLevels,
                ),
                const SizedBox(
                  height: 20,
                ),
                ContainerAndSheetTypeOne(
                  title: 'Job Type',
                  subtitle: 'Select job Type(s)',
                  staticList: staticTypes,
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
                                child: FutureBuilder<List<Qualification>>(
                                    future: UseFul().getThierSubCategory(
                                        selectedJobId.join(',')),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        var data = snapshot.data!;
                                        return ListView.builder(
                                            itemCount: data.length,
                                            itemBuilder: (context, index) {
                                              return ListTile(
                                                title: Text(
                                                  data[index].name,
                                                  textAlign: TextAlign.center,
                                                ),
                                                trailing:
                                                    selectedJobQualification
                                                            .contains(
                                                                data[index]
                                                                    .name)
                                                        ? IconButton(
                                                            icon: const Icon(
                                                                Icons.close),
                                                            onPressed: () {
                                                              setState(() {
                                                                // selectedJobId.remove(
                                                                //     data
                                                                //         .categories[
                                                                //             index]
                                                                //         .id);
                                                                selectedJobQualification
                                                                    .remove(data[
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
                                                    if (selectedJobQualification
                                                        .contains(
                                                            data[index].name)) {
                                                      // selectedJobId.remove(data
                                                      //     .categories[index].id);
                                                      selectedJobQualification
                                                          .remove(
                                                              data[index].name);
                                                    } else {
                                                      // selectedJobId.add(data
                                                      //     .categories[index].id);
                                                      selectedJobQualification
                                                          .add(
                                                              data[index].name);
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
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(jobQualification),
                                                const SizedBox(width: 8),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      selectedJobQualification
                                                          .remove(
                                                              jobQualification);
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
                            : const Text('Select job qualifications(s)'),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                ContainerAndSheetTypetwo(
                    title: 'City', staticList: StaticLists.city),
                const SizedBox(
                  height: 20,
                ),
                ContainerAndSheetTypetwo(
                  title: 'Experience',
                  staticList: StaticLists.experience,
                ),
                const SizedBox(
                  height: 20,
                ),
                ContainerAndSheetTypetwo(
                  title: 'Education',
                  staticList: StaticLists.education,
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    print(selectedJobId);
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
