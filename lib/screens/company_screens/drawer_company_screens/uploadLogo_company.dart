import 'dart:io';

import 'package:career_compass/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadLogo extends StatefulWidget {
  const UploadLogo({super.key});

  @override
  State<UploadLogo> createState() => _UploadPhotoEmployeeState();
}

class _UploadPhotoEmployeeState extends State<UploadLogo> {
  File? _file;

  Future pickerImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    setState(() {
      _file = File(returnedImage!.path);
    });
  }

  Future pickerImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImage == null) return;
    setState(() {
      _file = File(returnedImage!.path);
    });
  }

  void _cancelImage() {
    setState(() {
      _file = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        backgroundColor: AppColors.mainColor,
        title: const Text(
          'U P L O A D\n C O M P A N Y L O G O',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight / 9,
            ),
            _file != null
                ? Stack(
                    children: [
                      Center(
                        child: Image.file(
                          _file!,
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: screenHeight / 70,
                        right: screenWidth / 3.5,
                        child: GestureDetector(
                          onTap: _cancelImage,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.mainColor.withOpacity(0.5),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.mainColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text('No Selected Logo yet!'),
                      ),
                    ),
                  ),
            SizedBox(
              height: screenHeight / 13,
            ),
            SizedBox(
              width: 250,
              child: ElevatedButton.icon(
                onPressed: pickerImageFromGallery,
                icon: Icon(
                  Icons.photo_camera_back_rounded,
                  color: AppColors.mainColor,
                ),
                label: Text(
                  'Upload From Gallery',
                  style: TextStyle(color: AppColors.mainColor),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: screenHeight / 20,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(50)),
                child: const Center(
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
