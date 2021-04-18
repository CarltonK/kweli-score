import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kweliscore/provider/providers.dart';
import 'package:provider/provider.dart';

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

  File _statementFile;
  String urlResult, uid;
  List<String> _allowedExtentions;
  FileType _pickingType;

  @override
  void initState() {
    super.initState();

    // Get userId
    uid = context.read<AuthProvider>().currentUser.uid;

    _allowedExtentions = ['pdf'];
    _pickingType = FileType.custom;

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    )..addListener(() {
        setState(() {});
      });

    _animateIcon = Tween<double>(begin: 0.0, end: 1.0).animate(
      _animationController,
    );
    _animateColor = ColorTween(begin: Colors.blue, end: Colors.red).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 1.0, curve: _curve),
      ),
    );
    _translateButton = Tween<double>(begin: _fabHeight, end: -15.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.75, curve: _curve),
      ),
    );
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
        icon: AnimatedIcons.menu_close,
        progress: _animateIcon,
      ),
      onPressed: animate,
    );
  }

  void fileChooserBtnPressed() => pickFiles();

  pickFiles() async {
    try {
      FilePickerResult result = await FilePicker.platform.pickFiles(
        type: _pickingType,
        allowedExtensions: [..._allowedExtentions],
      );

      if (result != null) {
        _statementFile = File(result.files.single.path);
        Provider.of<StorageProvider>(context, listen: false).startUpload(
          _statementFile,
          uid,
        );
      }
    } on PlatformException catch (error) {
      print("Platform Exception: " + error.toString());
    } catch (error) {
      print("Unsupported operation: " + error.toString());
    }
  }

  Widget fileChooserBtn() {
    return Container(
      child: FloatingActionButton(
        onPressed: () => fileChooserBtnPressed(),
        tooltip: 'Select',
        child: const Icon(Icons.storage),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 2.0,
            0.0,
          ),
          child: const SizedBox(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value,
            0.0,
          ),
          child: fileChooserBtn(),
        ),
        fabBtn()
      ],
    );
  }
}
