import 'package:flutter/material.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:kweliscore/widgets/widgets.dart';

class SimbaSpend extends StatelessWidget {
  const SimbaSpend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(20),
          horizontal: getProportionateScreenHeight(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'FAMILY AND FRIENDS',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(7)),
              Text(
                'TOP 10 OUTGOING',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 20,
                  color: Colors.black45,
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(7)),
              Divider(
                thickness: 1,
              ),
              SizedBox(height: getProportionateScreenHeight(7)),
              SpendingCard(),
              SpendingCard(),
              SpendingCard(),
            ],
          ),
        ),
      ),
    );
  }
}
