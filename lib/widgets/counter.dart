import 'package:career_compass/provider/counter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomCounterContainer extends StatelessWidget {
  final String title;
  final int count;
  final Counter counter;
  final VoidCallback add;
  final VoidCallback sub;

  const CustomCounterContainer({
    required this.title,
    required this.count,
    required this.counter,
    required this.add,
    required this.sub,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 238, 230, 230),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Text(title),
            const SizedBox(
              width: 10,
            ),
            Row(
              children: [
                Text('$count'),
                const SizedBox(
                  width: 150,
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(145, 148, 145, 145),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        add();
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(145, 148, 145, 145),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: sub,
                      icon: const Icon(Icons.remove),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
