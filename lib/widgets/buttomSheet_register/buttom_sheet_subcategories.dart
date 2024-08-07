import 'package:career_compass/models/qual.dart';
import 'package:career_compass/provider/employee/register_screen_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContainerAndSheetSubcategories extends StatefulWidget {
  final String title;
  final String subtitle;
  final Future<List<Qualification>> qualificationList;
  const ContainerAndSheetSubcategories({
    required this.title,
    required this.subtitle,
    required this.qualificationList,
    super.key,
  });

  @override
  State<ContainerAndSheetSubcategories> createState() =>
      _ContainerAndSheetSubcategories();
}

class _ContainerAndSheetSubcategories
    extends State<ContainerAndSheetSubcategories> {
  List<String> selectedItemsList = [];

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
                  topRight: Radius.circular(50),
                ),
              ),
              context: context,
              builder: (context) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 222, 219, 219),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: FutureBuilder(
                    future: widget.qualificationList,
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
                                      icon: const Icon(
                                        Icons.close,
                                      ),
                                      onPressed: () {
                                        setState(
                                          () {
                                            selectedItemsList
                                                .remove(data[index].name);
                                            provider.removeFromSubCategories(
                                                data[index].name);
                                            Navigator.pop(context);
                                          },
                                        );
                                      },
                                    )
                                  : null,
                              onTap: () {
                                setState(() {
                                  if (selectedItemsList
                                      .contains(data[index].name)) {
                                    selectedItemsList.remove(data[index].name);
                                    provider.removeFromSubCategories(
                                        data[index].name);
                                  } else {
                                    selectedItemsList.add(data[index].name);
                                    provider
                                        .addToSubCategories(data[index].name);
                                  }
                                  Navigator.of(context).pop();
                                });
                              },
                            );
                          },
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                );
              },
            );
          },
          child: Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 238, 230, 230),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text(
                widget.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: selectedItemsList.isNotEmpty
                  ? SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (final item in selectedItemsList)
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(252, 235, 232, 232),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(item),
                                      const SizedBox(width: 8),
                                    ],
                                  ),
                                ),
                              ),
                            )
                        ],
                      ),
                    )
                  : Text(widget.subtitle),
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
