import 'package:career_compass/models/subcatygory.dart';
import 'package:career_compass/provider/company/job_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddQual extends StatefulWidget {
  final Future<List<Subcategory>> subCate;
  const AddQual({super.key, required this.subCate});

  @override
  State<AddQual> createState() => _AddQualState();
}

class _AddQualState extends State<AddQual> {
  List<String> selectedItemsList = [];
  List<int> selectedId = [];
  @override
  Widget build(BuildContext context) {
    final helper = Provider.of<JobHelper>(context, listen: false);
    return GestureDetector(
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
                        future: widget.subCate,
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
                                    trailing: selectedItemsList
                                            .contains(data[index].name)
                                        ? IconButton(
                                            icon: const Icon(Icons.close),
                                            onPressed: () {
                                              setState(() {
                                                helper
                                                    .removeQual(data[index].id);
                                                // selectedId
                                                //     .remove(data[index].id);
                                                selectedItemsList
                                                    .remove(data[index].name);
                                                Navigator.pop(context);
                                              });
                                            },
                                          )
                                        : null,
                                    onTap: () {
                                      setState(() {
                                        if (selectedItemsList
                                            .contains(data[index].name)) {
                                          helper.removeQual(data[index].id);
                                          selectedItemsList
                                              .remove(data[index].name);
                                        } else {
                                          helper.addQual(data[index].id);
                                          selectedItemsList
                                              .add(data[index].name);
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
              'Job Qualifications',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: selectedItemsList.isNotEmpty
                ? SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (final jobTitle in selectedItemsList)
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(252, 235, 232, 232),
                                borderRadius: BorderRadius.circular(8),
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
                                          selectedItemsList.remove(jobTitle);
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
                : const Text('Select job Qualification(s)'),
          )),
    );
  }
}
