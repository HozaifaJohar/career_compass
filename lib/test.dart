import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter/material.dart';


class PdfViewerPage extends StatefulWidget {
  const PdfViewerPage({super.key});

  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  final String url =
      'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('PDF Viewer'),
        ),
        body: PDFView(
            filePath: url,
            enableSwipe: true,
            swipeHorizontal: true,
            autoSpacing: false,
            pageFling: true,
            pageSnap: true,
            defaultPage: 0,
            fitEachPage: true,
            preventLinkNavigation: false));
  }
}
