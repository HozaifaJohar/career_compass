import 'dart:io';

import 'package:career_compass/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadPhotoEmployee extends StatefulWidget {
  const UploadPhotoEmployee({super.key});

  @override
  State<UploadPhotoEmployee> createState() => _UploadPhotoEmployeeState();
}

class _UploadPhotoEmployeeState extends State<UploadPhotoEmployee> {
  late File file;

  Future pickerImage() async {
    final myFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(myFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        backgroundColor: AppColors.mainColor,
        title: const Text(
          'U P L O A D\n PROFILE PHOTO',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(90),
            bottomRight: Radius.circular(90),
          ),
        ),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(40), child: SizedBox()),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: pickerImage, child: Text('Upload Photo')),
        ],
      ),
    );
  }
}
