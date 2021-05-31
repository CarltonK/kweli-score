import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kweliscore/screens/packages/package.dart';
import 'package:kweliscore/utilities/constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.only(left: 5),
          height: 5,
          width: 5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.blueGrey),
        ),
        title: Text(
          'Kweli Score',
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 30, top: 80, right: 30),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.blueAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [Text('AVG'), Text('62')],
                ),
                Container(
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // color: Colors.red,
                      border: Border.all(
                        color: Colors.greenAccent,
                        width: 7,
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('KweliScore'), Text('84')],
                  ),
                ),
                Column(
                  children: [Text('BEST'), Text('88')],
                ),
              ],
            ),
          ),

          //Draggable Scrollable Sheet
          DraggableScrollableSheet(
              initialChildSize: 0.5,
              minChildSize: 0.13,
              maxChildSize: 0.9,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  // controller: scrollController,
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16))),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 7,
                          width: 100,
                          color: Colors.grey,
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
                                      builder: (context) => Package()));
                            })
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
