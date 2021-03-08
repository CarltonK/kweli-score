import 'package:flutter/material.dart';
import 'package:kweliscore/screens/home_screen.dart';
import 'package:kweliscore/screens/package.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

class FreePackage extends StatefulWidget {
  @override
  _FreePackageState createState() => _FreePackageState();
}

class _FreePackageState extends State<FreePackage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Package()),
            )
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
          top: 50,
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              color: Colors.black12,
              child: Container(
                padding: EdgeInsets.only(
                  top: 30,
                  bottom: 30,
                  left: 120,
                  right: 120,
                ),
                child: Column(
                  children: [
                    Text('FREE'),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Basic Package'),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Ksh 0')
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Text(
                  'Features',
                  style: Constants.boldHeadlineStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [Icon(Icons.arrow_right), Text('Basic Report')],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [Icon(Icons.arrow_right), Text('Basic Report')],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [Icon(Icons.arrow_right), Text('Basic Report')],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [Icon(Icons.arrow_right), Text('Basic Report')],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [Icon(Icons.arrow_right), Text('Basic Report')],
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
            MaterialButton(
              minWidth: MediaQuery.of(context).size.width,
              elevation: 5,
              height: 55,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: Colors.lightBlueAccent,
              child: Text(
                'Select Basic Package',
                style: Constants.whiteBoldSubheadlineStyle,
              ),
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                )
              },
            ),
          ],
        ),
      ),
    );
  }
}
