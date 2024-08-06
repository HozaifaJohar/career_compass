import 'package:career_compass/provider/employee/get_primal.dart';
import 'package:career_compass/widgets/jobcard_employee.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PrimalScroll extends StatefulWidget {
  const PrimalScroll({super.key});

  @override
  State<PrimalScroll> createState() => _PrimalScrollState();
}

class _PrimalScrollState extends State<PrimalScroll> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Primal>(context, listen: false).getJobs();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                              id: job.id,
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
    );
  }
}
