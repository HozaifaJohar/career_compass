import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomLine extends StatelessWidget {
  final String leftText;
  final String rightText;
  final IconData icon;

  const CustomLine({
    super.key,
    required this.leftText,
    required this.rightText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Icon(icon, color: const Color.fromARGB(107, 94, 114, 226)),
            const SizedBox(width: 20),
            Text(leftText),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                rightText,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
