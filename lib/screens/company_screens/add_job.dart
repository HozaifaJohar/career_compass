import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/waves.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddJob extends StatefulWidget {
  const AddJob({super.key});

  @override
  State<AddJob> createState() => _AddJobState();
}

class _AddJobState extends State<AddJob> {
  String jobTitleSelected = '';
  String jobLevelSelected = '';
  String jobTypeSelected = '';
  String jobRoleSelected = '';
  String citySelected = '';
  String experienceSelected = '';
  String educateSelected = '';
  String genderSelected = '';
  List<String> jobTitle = [
    'Angular Developer',
    'Devops Engineer',
    'IT Help Desk',
    'React Native',
    'Animator Specialist',
    'Seo Specialist',
    'Marketing Specialist',
    'Digital Marketing Specialist',
    'Quality Assurance Specialist',
    'Human Resources Specialist',
    'Recruitment Specialist',
    'Billing Specialist',
    'Social Media Specialist',
    'Receptionist',
    'Interior Design',
    'Technical Support',
    'Marketing Director',
    'Secretary',
    'Executive Secretary',
    'Content Creator',
    'Collection Officer',
    'Content Writer',
    'Cope Writer',
    'Accountant',
    'Film/Video Editor',
    'Bussiness Analyst',
    'Bussiness Data Analyst',
    'System Analyst',
    'Data Entary',
    'Digital Marketing Manager',
    'Human Resources Manager',
    'Account  Manager',
    'Sales Manager',
    'Project Manager',
    'Marketing Manager',
    'Bussiness Development Manager',
    'Art Director',
    'Financial Manager',
    'Social Media Manager',
    'Executive Assistant',
    'Human Resources Assistant'
        'Adminstrative Assistant',
    'Motion Graphic Designer',
    'UI/UX Designer',
    'Graphic Designer',
    'Net Developer',
    'IOS Developer',
    'Laravel Developer',
    'PHP Developer',
    'Front End Developer',
    'React and Front Developer',
    'Backend Developer',
    'Android Developer',
    'Software Developer',
    'Mobile Application Developer',
    'Flutter Developer',
    'Wordpress Developer',
    'Web Developer',
    'Full Stack Developer',
    'Customer Services Representative',
    'Contact Center Representative',
    'Sales Representative',
    'Promoter',
    'Marketing Coordinator',
    'Corporate Sales Coordinator',
    'Data Entry Clerk',
    'Procurement Officer'
  ];
  List<String> gender = ['Male', 'Female', 'No Preferance'];
  List<String> jobLevel = [
    'Student',
    'Fresh Graduate',
    'Junior Professional',
    'Senior Professional',
    'Manager',
    'Director/Top Management'
  ];
  List<String> jobType = [
    'Full Time',
    'Contract',
    'FreeLancer/Project',
    'Intership',
    'Volunteering',
    'Work From Home'
  ];
  List<String> jobRole = [
    'Administration/Operations/Management',
    'Data Entry/Archiving',
    'Strategy/Consulting',
    'Research and Development/Statistic/Analyst',
    'IT/Software Development',
    'Banking/Insurance',
    'House Keeping/ Office boys/ Porter',
    'Translation/Writing/Editorial',
    'Marketing/ PR /Advertising',
    '  Graphic Design / Animation / Art',
    'Education / Teaching / Training',
    'Social Media / Journalism / Puublishing',
    'Quality',
    'Safety / Guard Services',
    'Customer Service / Support',
    'Maufacturing / Production',
    'Sport / Nutrition / Physiotherapy',
    'Pharming and Agriculture',
    'Divers / Delivery',
    'Secretarial / Resptionist',
    'Tourism / Travel / Hotels',
    'Pharmaceutical',
    'Medical / Healthcare / Nursing ',
    'Dentists / Prosthodontics',
    'Technician / Workers',
    'Legal / Contracts',
    'Chemistry / Laboratories',
    'Logistics / Warehouse / Supply Chain',
    'Sales / Retail /Distripution',
    'Accounting / Fenance',
    'Project / Program Management',
    'Purchasing / Procurement',
    'Restaurant / Catering / Cuisine',
    'Human Resources',
    'Fashion and Beauty',
    'Film and photography / Sound / Music ',
    ' Engineering-Construction / Civil / Architecture',
    'Interior Design / Decoration',
    'Engineering-Other',
    'Engineering-Telecom / Technology',
    'Engineering-Mechanical / Electrical / Medical',
    'engineering-Oil and Gas / Energy',
    'C_Level Executive / GM / Director',
    'Psychological support / Community services',
    'Other'
  ];
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
    'Edleb',
    'Al_Raqqah'
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
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
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
                                        itemCount: jobTitle.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            title: Text(
                                              jobTitle[index],
                                              textAlign: TextAlign.center,
                                            ),
                                            onTap: () {
                                              setState(() {
                                                jobTitleSelected =
                                                    jobTitle[index];
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
                            'Job Title',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(jobTitleSelected),
                        ),
                      ),
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
                                    child: ListView.builder(
                                        itemCount: jobLevel.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            title: Text(
                                              jobLevel[index],
                                              textAlign: TextAlign.center,
                                            ),
                                            onTap: () {
                                              setState(() {
                                                jobLevelSelected =
                                                    jobLevel[index];
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
                                    child: ListView.builder(
                                        itemCount: jobType.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            title: Text(
                                              jobType[index],
                                              textAlign: TextAlign.center,
                                            ),
                                            onTap: () {
                                              setState(() {
                                                jobTypeSelected =
                                                    jobType[index];
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
                                    child: ListView.builder(
                                        itemCount: jobRole.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            title: Text(
                                              jobRole[index],
                                              textAlign: TextAlign.center,
                                            ),
                                            onTap: () {
                                              setState(() {
                                                jobRoleSelected =
                                                    jobRole[index];
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
                            'Job Role',
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
                                                educateSelected =
                                                    education[index];
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
