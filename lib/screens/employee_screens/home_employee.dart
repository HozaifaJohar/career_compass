import 'package:career_compass/provider/employee/get_job_employee.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/jobcard_employee.dart';
import 'package:career_compass/widgets/waves.dart';
import 'package:flutter/material.dart';
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
      Provider.of<GetAllJobs>(context, listen: false).getAllJobs();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Consumer<GetAllJobs>(
          builder: (contxt, value, child) {
            if (value.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            final jobs = value.jobs;
            if (jobs.isEmpty) {
              return const Center(
                child: Text('oop there is no jobs to display'),
              );
            }
            return Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: jobs.length,
                      (context, index) {
                        final job = jobs[index];
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
          },
        ),
      ],
    );
  }
}
