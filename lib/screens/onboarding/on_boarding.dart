import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kweliscore/provider/providers.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:kweliscore/widgets/widgets.dart';
import 'package:provider/provider.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController? _pageController;
  int? _globalIndex;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    _pageController = PageController();
  }

  Widget _introHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Skip',
              style: Constants.kHeadlineStyle,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OffsetNotifier(_pageController!),
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              _introHeader(),
              SizedBox(height: DeviceConfig.screenHeight! * 0.08),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (int index) {
                    context.read<IndexNotifier>().index = index;
                    setState(() {
                      _globalIndex = index;
                    });
                  },
                  children: [IntroOne(), IntroTwo(), IntroThree()],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PageIndicator(),
                  ),
                  _globalIndex == 2
                      ? Padding(
                          padding: const EdgeInsets.only(right: 25),
                          child: GestureDetector(
                            child: Icon(
                              Icons.arrow_forward_ios,
                            ),
                            onTap: () => Navigator.of(context).pop(),
                          ),
                        )
                      : Container()
                ],
              ),
              SizedBox(height: DeviceConfig.screenHeight! * 0.08),
            ],
          ),
        ),
      ),
    );
  }
}
