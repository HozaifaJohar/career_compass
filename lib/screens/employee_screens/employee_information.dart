import 'package:career_compass/style/app_colors.dart';
import 'package:flutter/material.dart';


class ScientificInformation extends StatefulWidget {
  const ScientificInformation({super.key});

  @override
  State<ScientificInformation> createState() => _ScientificInformationState();
}

class _ScientificInformationState extends State<ScientificInformation> {
  String jobLevel = 'Select Now';
  String jobType = 'Select Now';
  String jobRoles = 'Select Naw';
  String city = 'Select Naw';
  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
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
                            child: ListView(
                              children: <Widget>[
                                ListTile(
                                  title: const Text('Fresh Graduate'),
                                  onTap: () {
                                    setState(() {
                                      jobLevel = 'Fresh Graduate';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text('Student'),
                                  onTap: () {
                                    setState(() {
                                      jobLevel = 'Student';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text('Junior Professional'),
                                  onTap: () {
                                    setState(() {
                                      jobLevel = 'Junior Professional';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text('Senior Professional'),
                                  onTap: () {
                                    setState(() {
                                      jobLevel = 'Senior Professional';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text('Manager'),
                                  onTap: () {
                                    setState(() {
                                      jobLevel = 'Manager';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text('Director/Top Management'),
                                  onTap: () {
                                    setState(() {
                                      jobLevel = 'Director/Top Management';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
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
                    subtitle: Text(jobLevel),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ////////////////////////////////////////////////////////////////////////
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
                            child: ListView(
                              children: <Widget>[
                                ListTile(
                                  title: const Text('Full Time'),
                                  onTap: () {
                                    setState(() {
                                      jobType = 'Full Time';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text('Contract'),
                                  onTap: () {
                                    setState(() {
                                      jobType = 'Contract';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text('Part Time'),
                                  onTap: () {
                                    setState(() {
                                      jobType = 'Part Time';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text('FreeLancer/Project'),
                                  onTap: () {
                                    setState(() {
                                      jobType = 'FreeLancer/Project';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text('Manager'),
                                  onTap: () {
                                    setState(() {
                                      jobType = 'Manager';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text('Intership'),
                                  onTap: () {
                                    setState(() {
                                      jobType = 'Intership';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
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
                    subtitle: Text(jobType),
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
                            child: ListView(
                              children: <Widget>[
                                ListTile(
                                  title: const Text('IT/SoftWare'),
                                  onTap: () {
                                    setState(() {
                                      jobRoles = 'IT/SoftWare';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text('Strategy/Consluting'),
                                  onTap: () {
                                    setState(() {
                                      jobRoles = 'Strategy/Consluting';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text('Part Time'),
                                  onTap: () {
                                    setState(() {
                                      jobRoles = 'Part Time';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text('FreeLancer/Project'),
                                  onTap: () {
                                    setState(() {
                                      jobRoles = 'FreeLancer/Project';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text('Translator'),
                                  onTap: () {
                                    setState(() {
                                      jobRoles = 'Translator';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text('Florist'),
                                  onTap: () {
                                    setState(() {
                                      jobRoles = 'Florist';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text('Graphic Designer'),
                                  onTap: () {
                                    setState(() {
                                      jobRoles = 'Graphic Designer';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
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
                    subtitle: Text(jobRoles),
                  ),
                ),
              ),
              /////////////////////////////////////////////////////////////
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
                            child: ListView(
                              children: <Widget>[
                                ListTile(
                                  title: const Text('Damascus'),
                                  onTap: () {
                                    setState(() {
                                      city = 'Damascus';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text('Lattakia'),
                                  onTap: () {
                                    setState(() {
                                      city = 'Lattakia';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text('Homs'),
                                  onTap: () {
                                    setState(() {
                                      city = 'Homs';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text('Hama'),
                                  onTap: () {
                                    setState(() {
                                      city = 'Hama';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text('Aleppo'),
                                  onTap: () {
                                    setState(() {
                                      city = 'Aleppo';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text('Tartous'),
                                  onTap: () {
                                    setState(() {
                                      city = 'Tartous';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text('Daraa'),
                                  onTap: () {
                                    setState(() {
                                      city = 'Daraa';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
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
                      'Work City',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(city),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/home_employee');
                  // print(jobLevel);
                },
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text('Complete'),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
