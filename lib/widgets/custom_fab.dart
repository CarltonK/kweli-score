import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:file_picker/file_picker.dart';
import 'package:kweliscore/widgets/widgets.dart';

class CustomFab extends StatefulWidget {
  @override
  _CustomFabState createState() => _CustomFabState();
}

class _CustomFabState extends State<CustomFab>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;

  AnimationController _animationController;
  Animation<Color> _animateColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 55;

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  File _imageFile;
  String filePath, urlResult;
  String uid;
  //StorageUploadTask storageUploadTask;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300))
          ..addListener(() {
            setState(() {});
          });

    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _animateColor = ColorTween(begin: Colors.blue, end: Colors.red).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.0, 1.0, curve: _curve)));
    _translateButton = Tween<double>(begin: _fabHeight, end: -15.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.0, 0.75, curve: _curve)));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget fabBtn() {
    return FloatingActionButton(
        backgroundColor: _animateColor.value,
        tooltip: 'Quick Menu',
        heroTag: 'fab',
        child: AnimatedIcon(
            icon: AnimatedIcons.menu_close, progress: _animateIcon),
        onPressed: animate);
  }

  /// Select an image via gallery or camera
  Future<void> pickImage(ImageSource source) async {
    await ImagePicker.pickImage(source: source).then((value) {
      if (value != null) {
        setState(() {
          _imageFile = value;
        });

        ///   _changePic();
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return FileUpload(
              file: _imageFile,
              uid: uid,
            );
          },
        );
      }
    });
  }

  void galleryBtnPressed() {
    pickImage(ImageSource.gallery);
  }

  Widget galleryBtn() {
    return Container(
      child: FloatingActionButton(
        onPressed: galleryBtnPressed,
        heroTag: 'gallery',
        tooltip: 'Gallery',
        child: Icon(Icons.storage),
      ),
    );
  }

  Widget cameraBtn() {
    return Container(
      child: FloatingActionButton(
        onPressed: null,
        heroTag: 'camera',
        tooltip: 'Camera',
        child: Icon(Icons.camera),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Transform(
            transform:
                Matrix4.translationValues(0.0, _translateButton.value, 0.0),
            child: galleryBtn()),
        fabBtn()
      ],
    );
  }
}
