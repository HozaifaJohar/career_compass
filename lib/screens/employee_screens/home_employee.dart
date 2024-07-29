import 'package:career_compass/provider/employee/get_primal.dart';
import 'package:career_compass/widgets/cat_ui.dart';
import 'package:career_compass/models/employee/job_employee.dart';
import 'package:career_compass/provider/employee/get_alljobs.dart';
import 'package:career_compass/provider/employee/get_filteredjob_employee.dart';
import 'package:career_compass/screens/employee_screens/all_job_category.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/jobcard_employee.dart';
import 'package:career_compass/widgets/waves.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomePageEmployee extends StatefulWidget {
  const HomePageEmployee({super.key});

  @override
  State<HomePageEmployee> createState() => _HomePageEmployeeState();
}

class _HomePageEmployeeState extends State<HomePageEmployee> {
  // :=) in state we use initState...
  // we put listen false out the build, in the build() we do not have to add listen:false when we use provider
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Alljobs>(context, listen: false).getJobs();
      Provider.of<Primal>(context, listen: false).getJobs();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<Alljobs>(
          builder: (context, value, child) {
            if (value.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            final jobs = value.jobs;
            var iteJobs = jobs.where((job) {
              return job.statics.any((staticItem) => staticItem.name == 'ITE');
            }).toList();
            var graphicDesignJobs = jobs.where((job) {
              return job.statics
                  .any((staticItem) => staticItem.name == 'Graphic Design');
            }).toList();
            var bankJobs = jobs.where((job) {
              return job.statics
                  .any((staticItem) => staticItem.name == 'Banking');
            }).toList();
            var educationJobs = jobs.where((job) {
              return job.statics
                  .any((staticItem) => staticItem.name == 'Education');
            }).toList();
            if (jobs.isEmpty) {
              return const Center(
                child: Text('oop there is no jobs to display'),
              );
            }
            return SizedBox(
              height: 130,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryUi(
                    icon: Icons.desktop_windows,
                    name: 'ITE',
                    jobs: iteJobs,
                  ),
                  CategoryUi(
                    icon: Icons.brush,
                    name: 'Graphic Design',
                    jobs: graphicDesignJobs,
                  ),
                  CategoryUi(
                    icon: Icons.money,
                    name: 'Banking',
                    jobs: bankJobs,
                  ),
                  CategoryUi(
                    icon: Icons.brush,
                    name: 'Education',
                    jobs: educationJobs,
                  ),
                ],
              ),
            );
          },
        ),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Primal Jobs'),
                  const SizedBox(
                    height: 5,
                  ),
                  Builder(builder: (context) {
                    return Consumer<Primal>(builder: (context, primal, child) {
                      if (primal.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final primalJobs = primal.jobs;
                      if (primalJobs.isEmpty) {
                        return const Center(
                          child: Text('oop there is no jobs to display'),
                        );
                      }
                      return Expanded(
                        child: CustomScrollView(
                          slivers: [
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                childCount: primalJobs.length,
                                (context, index) {
                                  final job = primalJobs[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: JobCardEmployee(
                                      statics: job.statics,
                                      company: job.company,
                                      subCategories: job.subCategories,
                                      description: job.description,
                                      title: job.title,
                                      salary: job.salary,
                                      gender: job.wantedGender,
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      );
                    });
                  })
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
// Column(
//       children: [
//         Consumer<Alljobs>(
//           builder: (contxt, value, child) {
//             if (value.isLoading) {
//               return const Center(child: CircularProgressIndicator());
//             }
//             final jobs = value.jobs;
//             if (jobs.isEmpty) {
//               return const Center(
//                 child: Text('oop there is no jobs to display'),
//               );
//             }
//             return Expanded(
//               child: CustomScrollView(
//                 slivers: [
//                   SliverList(
//                     delegate: SliverChildBuilderDelegate(
//                       childCount: jobs.length,
//                       (context, index) {
//                         final job = jobs[index];
//                         return Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: JobCardEmployee(
//                             statics: job.statics,
//                             company: job.company,
//                             subCategories: job.subCategories,
//                             description: job.description,
//                             title: job.title,
//                             salary: job.salary,
//                             gender: job.wantedGender,
//                           ),
//                         );
//                       },
//                     ),
//                   )
//                 ],
//               ),
//             );
//           },
//         ),
//       ],
//     );
