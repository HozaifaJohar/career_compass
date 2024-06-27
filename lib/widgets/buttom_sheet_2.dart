import 'dart:ui';

import 'package:flutter/material.dart';

class ContainerAndSheetTypetwo extends StatefulWidget {
  final String title;
  final List<String> staticList;
  const ContainerAndSheetTypetwo(
      {required this.title, required this.staticList, super.key});

  @override
  State<ContainerAndSheetTypetwo> createState() =>
      _ContainerAndSheetTypetwoState();
}

class _ContainerAndSheetTypetwoState extends State<ContainerAndSheetTypetwo> {
  String selectedItem = '';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50)),
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
                          setState(() {
                            selectedItem = widget.staticList[index];
                            Navigator.pop(context);
                          });
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
    );
  }
}
