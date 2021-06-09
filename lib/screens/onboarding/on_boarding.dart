import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kweliscore/provider/providers.dart';
import 'package:kweliscore/screens/screens.dart';
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
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {},
            child: Text('Skip',
                style: GoogleFonts.quicksand(
                    fontSize: 22, fontWeight: FontWeight.w800)),
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
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: PageView(
                controller: _pageController,
                onPageChanged: (int index) {
                  Provider.of<IndexNotifier>(context, listen: false).index =
                      index;
                  setState(() {
                    _globalIndex = index;
                  });
                },
                children: [IntroOne(), IntroTwo(), IntroThree()],
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PageIndicator(),
                  ),
                  _globalIndex == 2
                      ? Padding(
                          padding: EdgeInsets.only(right: 25),
                          child: GestureDetector(
                            child: Icon(
                              Icons.arrow_forward_ios,
                            ),
                            onTap: () {},
                          ))
                      : Container()
                ],
              ),
              SizedBox(
                height: 8,
              )
            ],
          ),
        ),
      ),
    );
  }
}
