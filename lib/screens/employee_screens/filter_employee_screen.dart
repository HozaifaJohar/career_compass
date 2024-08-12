import 'package:career_compass/provider/employee/get_filteredjob_employee.dart';
import 'package:career_compass/widgets/jobcard_employee.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterEployeeScreen extends StatefulWidget {
  const FilterEployeeScreen({
    super.key,
  });

  @override
  State<FilterEployeeScreen> createState() => _FilterEployeeScreenState();
}

class _FilterEployeeScreenState extends State<FilterEployeeScreen> {
  // :=) in state we use initState...
  // we put listen false out the build, in the build() we do not have to add listen:false when we use provider
  @override
  void initState() {
    final provider = Provider.of<FilteredJobs>(context, listen: false);
    print(provider.salary);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.getFilterJobs();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider2 = Provider.of<FilteredJobs>(context, listen: false);
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Consumer<FilteredJobs>(
            builder: (contxt, value, child) {
              if (value.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              final jobs = value.jobs;

              if (provider2.params.isEmpty) {
                return SizedBox(
                  height: screenHeight / 1.5,
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 200,
                          width: 200,
                          child: Image(image: AssetImage('images/emp.png')),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'oops..there are not jobs',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
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
                              id: job.id,
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
      ),
    );
  }
}
