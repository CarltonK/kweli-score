import 'package:flutter/material.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';

class ScrollableSheet extends StatelessWidget {
  static const Radius _commonRadius = Radius.circular(16);
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.13,
        maxChildSize: 0.9,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            padding: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: _commonRadius,
                topRight: _commonRadius,
              ),
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  Container(
                    height: 7,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Credit History',
                        style: Constants.boldHeadlineStyle,
                      ),
                      Icon(Icons.more_vert)
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'A snapshot of your credit lifetime giving you an overview of what lenders see',
                    style: Constants.blackBoldNormal,
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Image.asset('assets/images/data1.png'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'A summary of the users transactions giving the user an overview of their spending',
                    style: Constants.blackBoldNormal,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                      elevation: 5,
                      height: 55,
                      minWidth: MediaQuery.of(context).size.width,
                      color: Colors.greenAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        'Upgrade my Report',
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Package(),
                          ),
                        );
                      })
                ],
              ),
            ),
          );
        });
  }
}
