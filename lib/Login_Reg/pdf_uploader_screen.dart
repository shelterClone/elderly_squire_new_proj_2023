import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfUploaderScreen extends StatefulWidget {
  @override
  _PdfUploaderScreenState createState() => _PdfUploaderScreenState();
}

class _PdfUploaderScreenState extends State<PdfUploaderScreen> {
  String? _pdfPath;
  bool _isLoading = false;

  void _pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _pdfPath = result.files.single.path!;
      });
    }
  }

  void _uploadPDF() async {
    if (_pdfPath == null) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      FormData formData = FormData.fromMap({
        'pdf': await MultipartFile.fromFile(_pdfPath!),
      });

      Dio dio = Dio();
      await dio.post('your_upload_url', data: formData);

      // Handle successful upload
      print('PDF uploaded successfully');
    } catch (e) {
      // Handle upload error
      print('Failed to upload PDF: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text('PDF Uploader'),
//      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _pickPDF,
              child: Text('Sinumpaang Salaysay PDF'),
            ),
            SizedBox(height: 16.0),
            if (_pdfPath != null)
              ElevatedButton(
                onPressed: _uploadPDF,
                child: Text('Upload PDF'),
              ),
            SizedBox(height: 16.0),
            if (_isLoading)
              CircularProgressIndicator()
            else if (_pdfPath != null)
              Flexible(
                child: PDFView(
                  filePath: _pdfPath!,
                ),
              ),
          ],
        ),
      ));

  }
}
