import 'package:career_compass/style/app_colors.dart';
import 'package:flutter/material.dart';

class ResisterCompanyScreen extends StatelessWidget {
  const ResisterCompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        backgroundColor: AppColors.mainColor,
        title: const Text(
          'COMPANY\n I N F O R M A T I O N',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(90),
          bottomRight: Radius.circular(90),
        )),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(65), child: SizedBox()),
      ),
    );
  }
}
