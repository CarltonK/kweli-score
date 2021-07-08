import 'package:flutter/material.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:kweliscore/widgets/widgets.dart';

class SimbaSpend extends StatelessWidget {
  SimbaSpend({Key? key}) : super(key: key);
  final List<String> _tabs = ['Incoming', 'Outgoing'];
  final dynamic _cards = ['Incoming', 'Outgoing'];

  final List<Widget> _children = [
    Container(
      margin: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(20),
        horizontal: getProportionateScreenHeight(20),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpendingCard(
              isIncoming: true,
              phoneNumber: '0727286123',
              name: 'Mark Carlton',
              amount: '17,500',
            ),
            SpendingCard(
              isIncoming: true,
              phoneNumber: '0727286123',
              name: 'Eric Kinyua',
              amount: '19,500',
            ),
            SpendingCard(
              isIncoming: true,
              phoneNumber: '0727286123',
              name: 'Edward Kaharo',
              amount: '97,500',
            ),
          ],
        ),
      ),
    ),
    Container(
      margin: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(20),
        horizontal: getProportionateScreenHeight(20),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpendingCard(
              phoneNumber: '0727286123',
              name: 'Mark Carlton',
              amount: '17,500',
            ),
            SpendingCard(
              phoneNumber: '0727286123',
              name: 'Eric Kinyua',
              amount: '19,500',
            ),
            SpendingCard(
              phoneNumber: '0727286123',
              name: 'Edward Kaharo',
              amount: '97,500',
            ),
          ],
        ),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            leading: Container(),
            title: Text('PAYBILL TRANSACTIONS',
                style: Constants.kHeadlineStyle
                    .copyWith(fontWeight: FontWeight.normal, fontSize: 18)),
            centerTitle: true,
            backgroundColor: Palette.backgroundWhite,
            elevation: 0,
            actions: [
              GlobalCircleButton(
                icon: Icons.cancel,
                color: Colors.black,
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
            bottom: TabBar(
              tabs: _tabs.map((e) => TabWidget(title: e)).toList(),
              indicator:
                  CircularTabIndicator(color: Palette.ksmartPrimary, radius: 4),
              indicatorPadding: const EdgeInsets.all(-5),
            ),
          ),
          body: TabBarView(children: _children)),
    );
  }
}
