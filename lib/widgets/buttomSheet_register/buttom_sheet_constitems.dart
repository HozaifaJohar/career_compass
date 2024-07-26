import 'dart:ui';

import 'package:career_compass/provider/employee/register_screen_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContainerAndSheetConstants extends StatefulWidget {
  final String title;
  final List<String> staticList;

  const ContainerAndSheetConstants(
      {required this.title, required this.staticList, super.key});

  @override
  State<ContainerAndSheetConstants> createState() =>
      _ContainerAndSheetConstants();
}

class _ContainerAndSheetConstants extends State<ContainerAndSheetConstants> {
  String selectedItem = 'Required';
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegisterHelper>(context, listen: false);
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
                shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                ),
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 222, 219, 219),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListView.builder(
                        itemCount: widget.staticList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              widget.staticList[index],
                              textAlign: TextAlign.center,
                            ),
                            onTap: () {
                              setState(
                                () {
                                  selectedItem = widget.staticList[index];
                                  if (widget.title == 'Experience') {
                                    provider.experience = selectedItem;
                                    provider.numItems++;
                                  } else {
                                    provider.education = selectedItem;
                                    provider.numItems++;
                                  }
                                  Navigator.pop(context);
                                },
                              );
                            },
                          );
                        },
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
              title: Text(
                widget.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(selectedItem),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
