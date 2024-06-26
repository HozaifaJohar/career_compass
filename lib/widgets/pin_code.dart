import 'package:flutter/material.dart';

import 'package:pinput/pinput.dart';

class CustomPinCode extends StatefulWidget {
  final int length;
  final ValueChanged<String> onCompleted;
  final TextEditingController pinPutController;
  final String validateMessage;

  const CustomPinCode({
    super.key,
    required this.length,
    required this.onCompleted,
    required this.pinPutController,
    required this.validateMessage,
  });

  @override
  _CustomPinCodeState createState() => _CustomPinCodeState();
}

class _CustomPinCodeState extends State<CustomPinCode> {
//  final _pinputController = TextEditingController();

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
      controller: widget.pinPutController,
      length: widget.length,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      onCompleted: (pin) {
        widget.onCompleted(pin);
      },
      validator: (String? value) {
        if (value!.isEmpty || value.length < 6) {
          return widget.validateMessage;
        }
        return null;
      },
    );
  }
}
