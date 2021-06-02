import 'package:flutter/material.dart';
import 'package:kweliscore/provider/providers.dart';
import 'package:kweliscore/widgets/scrollable_sheet.dart';
import 'package:kweliscore/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.only(left: 5),
          height: 5,
          width: 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.blueGrey,
          ),
        ),
        title: Text(
          'Kweli Score',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              context.read<ApiProvider>().status = Status.Unauthenticated;
            },
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 30, top: 80, right: 30),
            height: size.height,
            width: size.width,
            color: Colors.blueAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      'AVG',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text('62', style: TextStyle(color: Colors.white)),
                  ],
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
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'KweliScore',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text('84', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'BEST',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text('88', style: TextStyle(color: Colors.white))
                  ],
                ),
              ],
            ),
          ),
          //Draggable Scrollable Sheet
          ScrollableSheet(),
        ],
      ),
    );
  }
}
