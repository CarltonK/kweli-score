import 'dart:io';

import 'package:flutter/material.dart';

class FileUpload extends StatefulWidget {
  final File file;
  final String uid;
  FileUpload({required this.file, required this.uid});

  @override
  _FileUploadState createState() => _FileUploadState();
}

class _FileUploadState extends State<FileUpload> {
  Widget _cancelPost() {
    return TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Icon(
          Icons.cancel,
          size: 30,
          color: Colors.red,
        ));
  }

  Widget _uploadPost() {
    return TextButton(
        onPressed: () {},
        child: Icon(
          Icons.send,
          size: 30,
          color: Colors.green,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: <Widget>[
        _cancelPost(),
        _uploadPost(),
      ],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.file(widget.file)),
        ],
      ),
    );
  }
}
