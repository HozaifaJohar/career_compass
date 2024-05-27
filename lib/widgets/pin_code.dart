import 'package:flutter/material.dart';

import 'package:pinput/pinput.dart';

class CustomPinCode extends StatefulWidget {
  final int length;
  final ValueChanged<String> onCompleted;

  const CustomPinCode({
    super.key,
    required this.length,
    required this.onCompleted,
  });

  @override
  _CustomPinCodeState createState() => _CustomPinCodeState();
}

class _CustomPinCodeState extends State<CustomPinCode> {
  final _pinputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(135, 191, 185, 185),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xffF68623)),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: const Color(0xFF5E72E2)),
      ),
    );

    return Pinput(
      controller: _pinputController,
      length: widget.length,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      onCompleted: (pin) {
        widget.onCompleted(pin);
      },
    );
  }
}
