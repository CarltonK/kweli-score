import 'package:flutter/material.dart';
import 'package:kweliscore/screens/home/home.dart';
import 'package:kweliscore/utilities/utilities.dart';

class PricingScreen extends StatefulWidget {
  const PricingScreen({Key? key}) : super(key: key);

  @override
  _PricingScreenState createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen> {
  final int _numPages = 3;
  int _currentPage = 0;
  Color? color;
  PageController? pageController;

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: isActive ? 16 : 12,
      width: isActive ? 16 : 12,
      decoration: BoxDecoration(
        color: isActive ? color : Colors.lightBlue[100],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget indicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildPageIndicator(),
    );
  }

  _onPageChange(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  mainBody() {
    return Expanded(
      child: PageView.builder(
        controller: pageController!,
        itemCount: 3,
        onPageChanged: _onPageChange,
        itemBuilder: (context, index) {
          return SinglePriceCard(
            index: index,
            controller: pageController!,
          );
        },
      ),
    );
  }

  @override
  void initState() {
    pageController = PageController(viewportFraction: 0.8, initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => KeyboardUtil.hideKeyboard(context),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
            ),
            child: Column(
              children: [
                SizedBox(height: DeviceConfig.screenHeight! * 0.04),
                Text(
                  'Choose your plan',
                  style: Constants.kHeadlineStyle,
                ),
                mainBody(),
                SizedBox(height: DeviceConfig.screenHeight! * 0.08),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
