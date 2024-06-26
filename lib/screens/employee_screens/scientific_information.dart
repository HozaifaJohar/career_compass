import 'package:career_compass/models/qual.dart';
import 'package:career_compass/models/static.dart';
import 'package:career_compass/models/subcatygory.dart';
import 'package:career_compass/services/employee/get_selection.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:flutter/material.dart';

class ScientificInformation extends StatefulWidget {
  const ScientificInformation({super.key});

  @override
  State<ScientificInformation> createState() => _ScientificInformationState();
}

class _ScientificInformationState extends State<ScientificInformation> {
  late Future<Static> _futureStatic;
  late Future<List<Subcategory>> _futuresubcategory;
  TextEditingController address = TextEditingController();
  List<String> selectedJobCategoey = [];
  List<String> selectedJobQualification = [];
  List<int> selectedJobId = [];
  String jobLevelSelected = '';
  String jobTypeSelected = '';
  String citySelected = '';
  String experienceSelected = '';
  String educateSelected = '';
  @override
  void initState() {
    super.initState();
    _futureStatic = GetStaticForEmmployee().getAllStatic();
    // _futuresubcategory = GetStaticForEmmployee().getSubcategory(selectedJobId);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    List<String> city = [
      'Damascus',
      'Rif Dimashq',
      'Homs',
      'Hama',
      'Aleppo',
      'Daraa',
      'Al_Qunaitra',
      'Dair Al_Zour',
      'Al-Hasaka',
      'Siwdaa',
      'Tartous',
      'Lattakia',
      'Edleb'
    ];
    List<String> experience = [
      'None',
      '1 year',
      '2 Years',
      '3 Years',
      '4 Years',
      '5 Years',
      '6 Years',
      '7 Years',
      '8 Years',
      '9 Years',
      '10 Years',
      'More than 10 years'
    ];
    List<String> education = [
      'None',
      'High School',
      'Instutional Degree',
      'Bachelor Degree',
      'Diploma',
      'Master Degree',
      'Doctorate'
    ];
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
                                            itemCount: data.categories.length,
                                            itemBuilder: (context, index) {
                                              return ListTile(
                                                title: Text(
                                                  data.categories[index].name,
                                                  textAlign: TextAlign.center,
                                                ),
                                                trailing: selectedJobCategoey
                                                        .contains(data
                                                            .categories[index]
                                                            .name)
                                                    ? IconButton(
                                                        icon: const Icon(
                                                            Icons.close),
                                                        onPressed: () {
                                                          setState(() {
                                                            selectedJobId
                                                                .remove(data
                                                                    .categories[
                                                                        index]
                                                                    .id);
                                                            selectedJobCategoey
                                                                .remove(data
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
                                                            .categories[index]
                                                            .name)) {
                                                      selectedJobId.remove(data
                                                          .categories[index]
                                                          .id);
                                                      selectedJobCategoey
                                                          .remove(data
                                                              .categories[index]
                                                              .name);
                                                    } else {
                                                      selectedJobId.add(data
                                                          .categories[index]
                                                          .id);
                                                      selectedJobCategoey.add(
                                                          data.categories[index]
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
                                    for (final jobTitle in selectedJobCategoey)
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
                                            itemCount: data.levels.length,
                                            itemBuilder: (context, index) {
                                              return ListTile(
                                                title: Text(
                                                  data.levels[index].name,
                                                  textAlign: TextAlign.center,
                                                ),
                                                onTap: () {
                                                  setState(() {
                                                    jobLevelSelected =
                                                        data.levels[index].name;
                                                    Navigator.pop(context);
                                                  });
                                                },
                                              );
                                            });
                                      } else {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
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
                                child: FutureBuilder(
                                    future: _futureStatic,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        var data = snapshot.data!;
                                        return ListView.builder(
                                            itemCount: data.jobTypes.length,
                                            itemBuilder: (context, index) {
                                              return ListTile(
                                                title: Text(
                                                  data.jobTypes[index].name,
                                                  textAlign: TextAlign.center,
                                                ),
                                                onTap: () {
                                                  setState(() {
                                                    jobTypeSelected = data
                                                        .jobTypes[index].name;
                                                    Navigator.pop(context);
                                                  });
                                                },
                                              );
                                            });
                                      } else {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
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
                                child: FutureBuilder<List<Qualification>>(
                                    future: GetStaticForEmmployee()
                                        .getSubcategory(selectedJobId.join(',')),
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
                                    itemCount: city.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        title: Text(
                                          city[index],
                                          textAlign: TextAlign.center,
                                        ),
                                        onTap: () {
                                          setState(() {
                                            citySelected = city[index];
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
                        'City',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(citySelected),
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
                                child: ListView.builder(
                                    itemCount: experience.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        title: Text(
                                          experience[index],
                                          textAlign: TextAlign.center,
                                        ),
                                        onTap: () {
                                          setState(() {
                                            experienceSelected =
                                                experience[index];
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
                        'Experience',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(experienceSelected),
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
                                child: ListView.builder(
                                    itemCount: education.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        title: Text(
                                          education[index],
                                          textAlign: TextAlign.center,
                                        ),
                                        onTap: () {
                                          setState(() {
                                            educateSelected = education[index];
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
                        'Education',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(educateSelected),
                    ),
                  ),
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
