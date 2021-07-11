import 'package:flutter/material.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:kweliscore/widgets/widgets.dart';

class TabbedViewTransactions extends StatelessWidget {
  TabbedViewTransactions({
    Key? key,
    this.initialIndex = 0,
    required this.title,
  }) : super(key: key);
  final String title;
  final int initialIndex;

  final List<String> _tabs = ['Incoming', 'Outgoing'];

  final List<Widget> _children = [
    Container(
      margin: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(20),
        horizontal: getProportionateScreenHeight(20),
      ),
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) => SingleTransactionCard(
          isIncoming: true,
          phone: '0712345678',
          name: 'K-Smart User',
          amount: '17,500',
        ),
      ),
    ),
    Container(
      margin: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(20),
        horizontal: getProportionateScreenHeight(20),
      ),
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) => SingleTransactionCard(
          phone: '0712345678',
          name: 'K-Smart User',
          amount: '15,000',
        ),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: initialIndex,
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text(
            title,
            style: Constants.kHeadlineStyle.copyWith(
              fontWeight: FontWeight.normal,
              fontSize: 18,
            ),
          ),
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
            indicator: CircularTabIndicator(
              color: Palette.ksmartPrimary,
              radius: 4,
            ),
            indicatorPadding: const EdgeInsets.all(-5),
          ),
        ),
        body: TabBarView(children: _children),
      ),
    );
  }
}
