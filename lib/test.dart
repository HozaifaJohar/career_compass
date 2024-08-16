import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class PdfViewerPage extends StatefulWidget {
  final String url;

  const PdfViewerPage({super.key, required this.url});

  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  String? localPath;

  @override
  void initState() {
    super.initState();
    _downloadAndSavePdf();
  }

  Future<void> _downloadAndSavePdf() async {
    try {
      final response = await http.get(Uri.parse(widget.url));
      print(response.statusCode);
      if (response.statusCode == 200) {
        final directory = await getApplicationDocumentsDirectory();
        final file = File('${directory.path}/temp.pdf');
        await file.writeAsBytes(response.bodyBytes);
        setState(() {
          localPath = file.path;
        });
      } else {
        throw Exception('Failed to load PDF');
      }
    } catch (e) {
      print('Error downloading PDF: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Employee Cv',
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      body: localPath != null
          ? PDFView(
              filePath: localPath!,
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
