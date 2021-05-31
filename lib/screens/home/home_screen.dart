import 'package:flutter/material.dart';
import 'package:kweliscore/provider/providers.dart';
import 'package:kweliscore/widgets/widgets.dart';
import 'package:provider/provider.dart';

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, value, child) {
     //   _authProvider = value;
        return child;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'KWELI SCORE',
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {},
            )
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 50, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    Text(
                      'AVG',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text('62',
                        style: TextStyle(
                          color: Colors.white,
                        ))
                  ],
                ),
                Container(
                  height: 350,
                  width: 340,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // color: Colors.red,
                      border: Border.all(
                        color: Colors.greenAccent,
                        width: 7,
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'KweliScore',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        '84',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'BEST',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      '88',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

          //Draggable Scrollable Sheet
          // DraggableScrollableSheet(
          //     initialChildSize: 0.5,
          //     minChildSize: 0.13,
          //     maxChildSize: 0.9,
          //     builder:
          //         (BuildContext context, ScrollController scrollController) {
          //       return ScrollableSheet(scrollController: scrollController);
          //     })
        ],
      ),
    ));
    
  }
}
