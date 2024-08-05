import 'package:career_compass/models/job.dart';
import 'package:career_compass/provider/company/jobs_provider.dart';
import 'package:career_compass/provider/company/onTap_nav_company.dart';
import 'package:career_compass/screens/company_screens/companyjob_details.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/jobcard_company.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomePageCompany extends StatefulWidget {
  const HomePageCompany({super.key});

  @override
  State<HomePageCompany> createState() => _HomePageCompanyState();
}

class _HomePageCompanyState extends State<HomePageCompany> {
  late Future<List<Job>> _jobs;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<JobProvider>(context, listen: false).getJobs();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Consumer<JobProvider>(
            builder: (context, job, child) {
              if (job.jobs.isEmpty) {
                return Center(
                  child: Column(
                    children: [
                      Image.asset('images/man.gif'),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: MaterialButton(
                          color: AppColors.mainColor,
                          onPressed: () {
                            Provider.of<OntapNavigationCompany>(context,
                                    listen: false)
                                .setIndex(1);
                          },
                          child: const Center(
                            child: Text(
                              'Add New Job',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else if (job.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final jobs = job.jobs;
              return Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                            childCount: jobs.length, (context, index) {
                      final job = jobs[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CompanyJobDetails(job: job)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: JobCardCompany(
                            jobTitle: job.title,
                            jobStatic: job.jobStatic,
                          ),
                        ),
                      );
                    }))
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
