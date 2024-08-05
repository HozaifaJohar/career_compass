import 'dart:io';
import 'dart:ui';
import 'package:career_compass/constant/url.dart';
import 'package:career_compass/core/shared_preferences.dart';
import 'package:career_compass/helper/api.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/flash_message.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:image_picker/image_picker.dart';

class UploadCv extends StatefulWidget {
  const UploadCv({super.key});

  @override
  State<UploadCv> createState() => _UploadCvState();
}

class _UploadCvState extends State<UploadCv> {
  String url = AppString.baseUrl;
  File? _pickedPdf;
  String? path;
  String? pdfName;
  Future _pickFile() async {
    final FilePickerResult? returnedPdf = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (returnedPdf != null && returnedPdf.files.isNotEmpty) {
      setState(() {
        _pickedPdf = File(returnedPdf.files.single.path!);
      });
      String pdfName = _pickedPdf!.path.split('/').last;
      String path = _pickedPdf!.path;
      print('/////${path}/////');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          elevation: 0,
          content: FlashMessage(
            errorText: 'No Pdf Selected!',
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
        ),
      );
    }
  }

  void _cancelPDF() {
    setState(() {
      _pickedPdf = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        backgroundColor: AppColors.mainColor,
        title: const Text(
          'UPLOAD\n Y U O R  C V',
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _pickedPdf != null
                ? Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.mainColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.picture_as_pdf,
                              color: Colors.red,
                              size: 40,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Selected PDF : ${_pickedPdf!.path.split('/').last}',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: GestureDetector(
                          onTap: _cancelPDF,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                : Container(
                    width: screenWidth / 1.5,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.mainColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'No Pdf selected',
                      ),
                    ),
                  ),
            SizedBox(
              height: screenHeight / 15,
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton.icon(
                onPressed: _pickFile,
                icon: Icon(
                  Icons.upload_file,
                  color: AppColors.mainColor,
                ),
                label: Text(
                  'Pick Pdf',
                  style: TextStyle(color: AppColors.mainColor),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 150,
              child: ElevatedButton.icon(
                //  onPressed: _pdfFile != null ? _uploadPDF : null,
                onPressed: () {
                  if (_pickedPdf != null) {
                    Api().postFiles(
                      url: '$url/employees/upload-image',
                      filePath: _pickedPdf!.path,
                      key: 'file',
                      token: CashMemory().getCashData(key: 'accessToken'),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        elevation: 0,
                        content: FlashMessage(
                          errorText: "NO File Selected Yet!",
                        ),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                      ),
                    );
                  }
                },
                icon: Icon(
                  Icons.cloud_upload,
                  color: AppColors.mainColor,
                ),
                label: Text(
                  'Upload PDF',
                  style: TextStyle(color: AppColors.mainColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: PDFPickerScreen(),
//     );
//   }
// }

// class PDFPickerScreen extends StatefulWidget {
//   @override
//   _PDFPickerScreenState createState() => _PDFPickerScreenState();
// }

// class _PDFPickerScreenState extends State<PDFPickerScreen> {
//   File? _pdfFile;

//   Future<void> _pickPDF() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf'],
//     );

//     if (result != null && result.files.isNotEmpty) {
//       setState(() {
//         _pdfFile = File(result.files.single.path!);
//       });
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('No PDF selected')),
//       );
//     }
//   }

//   Future<void> _uploadPDF() async {
//     if (_pdfFile == null) return;

//     String uploadUrl = 'http://your-local-server/upload'; // Replace with your server URL

//     try {
//       var request = http.MultipartRequest('POST', Uri.parse(uploadUrl));
//       request.files.add(await http.MultipartFile.fromPath(
//         'file',
//         _pdfFile!.path,
//         contentType: MediaType('application', 'pdf'),
//       ));

//       var response = await request.send();

//       if (response.statusCode == 200) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Upload successful')),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Upload failed')),
//         );
//       }
//     } catch (e) {
//       print('Error uploading file: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error uploading file')),
//       );
//     }
//   }

//   void _cancelPDF() {
//     setState(() {
//       _pdfFile = null;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Pick and Upload PDF'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             _pdfFile != null
//                 ? Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       Container(
//                         padding: EdgeInsets.all(16.0),
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.grey),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(Icons.picture_as_pdf, color: Colors.red, size: 40),
//                             SizedBox(width: 10),
//                             Expanded(
//                               child: Text(
//                                 'Selected PDF: ${_pdfFile!.path.split('/').last}',
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Positioned(
//                         top: 5,
//                         right: 5,
//                         child: GestureDetector(
//                           onTap: _cancelPDF,
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: Colors.red,
//                               shape: BoxShape.circle,
//                             ),
//                             child: Icon(
//                               Icons.close,
//                               color: Colors.white,
//                               size: 20,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
//                 : Container(
//                     padding: EdgeInsets.all(16.0),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Center(
//                       child: Text('No PDF selected'),
//                     ),
//                   ),
//             SizedBox(height: 20),
//             ElevatedButton.icon(
//               onPressed: _pickPDF,
//               icon: Icon(Icons.upload_file),
//               label: Text('Pick PDF'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton.icon(
//               onPressed: _pdfFile != null ? _uploadPDF : null,
//               icon: Icon(Icons.cloud_upload),
//               label: Text('Upload PDF'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }