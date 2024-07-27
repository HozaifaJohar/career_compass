import 'package:career_compass/models/static.dart';
import 'package:career_compass/provider/company/job_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddStatic extends StatefulWidget {
  String title;
  final Future<List<Category>> staticList;
  AddStatic({super.key, required this.staticList, required this.title});

  @override
  State<AddStatic> createState() => _AddStaticState();
}

class _AddStaticState extends State<AddStatic> {
  String selectedItem = '';
  int LevelId = 0;
  String JobType = '';
  int TypeId = 0;
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
                        future: widget.staticList,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final data = snapshot.data!;
                            return ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(
                                      data[index].name,
                                      textAlign: TextAlign.center,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        if (widget.title == 'Level') {
                                          selectedItem = data[index].name;
                                          helper.addIdLevel(data[index].id);
                                        } else {
                                          selectedItem = data[index].name;
                                          helper.addIdTepe(data[index].id);
                                        }

                                        Navigator.pop(context);
                                      });
                                    },
                                  );
                                });
                          } else {
                            return const Text('nodata');
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
          title: Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(selectedItem),
        ),
      ),
    );
  }
}
