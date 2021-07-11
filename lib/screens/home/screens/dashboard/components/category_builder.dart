import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';

class CategoryBuilder extends StatefulWidget {
  const CategoryBuilder({
    Key? key,
  }) : super(key: key);

  @override
  _CategoryBuilderState createState() => _CategoryBuilderState();
}

class _CategoryBuilderState extends State<CategoryBuilder> {
  PageController? _controller;
  double _animatedWidth = 0;
  @override
  void initState() {
    _controller = PageController(
      viewportFraction: 0.7,
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  _widthSizer() {
    setState(() {
      _animatedWidth = 150;
    });
  }

  @override
  Widget build(BuildContext context) {
    Timer(Constants.veryFluidDuration, _widthSizer);
    return Container(
      height: getProportionateScreenHeight(150),
      child: PageView.builder(
        controller: _controller,
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      TabbedViewTransactions(title: 'Paybills'),
                ),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9),
              ),
              elevation: 3,
              margin: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(10),
                horizontal: getProportionateScreenWidth(5),
              ),
              color: Colors.grey[100],
              child: Container(
                width: getProportionateScreenWidth(250),
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Personal transactions',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AnimatedContainer(
                      curve: Constants.verySmoothCurve,
                      duration: Constants.fluidDuration,
                      height: 12,
                      width: _animatedWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(2),
                    ),
                    Text(
                      'Outgoing',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(7),
                    ),
                    AnimatedContainer(
                      duration: Constants.fluidDuration,
                      height: 12,
                      width: _animatedWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.greenAccent,
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(2),
                    ),
                    Text(
                      'Incoming',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
