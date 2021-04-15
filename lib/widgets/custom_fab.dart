import 'package:flutter/material.dart';
// import 'package:kweliscore/widgets/widgets.dart';
// import 'package:file_picker/file_picker.dart';

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

  // File _statementFile;
  String filePath, urlResult;
  String uid;
  // StorageUploadTask storageUploadTask;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    )..addListener(() {});

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

  void fileChooserBtnPressed() {}

  Widget fileChooserBtn() {
    return Container(
      child: FloatingActionButton(
        onPressed: fileChooserBtnPressed,
        heroTag: 'gallery',
        tooltip: 'Files',
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
