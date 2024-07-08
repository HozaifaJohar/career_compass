import 'package:flutter/material.dart';

class RowDetails extends StatelessWidget {
  final String firstText;
  final String lastText;
  final IconData iconData; 

  const RowDetails({
    super.key,
    required this.firstText,
    required this.lastText,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData, color: Color.fromARGB(107, 94, 114, 226)),
        const SizedBox(width: 20),
        Text(firstText),
        const SizedBox(width: 20),
        Text(lastText),
      ],
    );
  }
}
