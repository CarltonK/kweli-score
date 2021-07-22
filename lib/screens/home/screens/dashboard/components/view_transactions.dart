import 'package:flutter/material.dart';
import 'package:kweliscore/models/models.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:kweliscore/widgets/widgets.dart';

class ListedViewTransactions extends StatelessWidget {
  ListedViewTransactions({
    Key? key,
    required this.title,
    required this.listItems,
  }) : super(key: key);
  final String title;
  final List<dynamic> listItems;

  static String? titleKey = '';
  static String? amountKey = '';

  static String? extraKey;
  static IconData? iconData = Icons.monetization_on;

  String _subtitlePicker(int index) {
    String? subtitle = '';
    dynamic currentItem = listItems[index];
    // Check by type
    Type type = currentItem.runtimeType;
    switch (type) {
      case RecordP2PIncoming:
        subtitle = 'These are the people who send money to you';
        break;
      case RecordP2POutgoing:
        subtitle = 'These are the people you send money to';
        break;
      case RecordPaybillsIncoming:
        subtitle = 'These are the paybills you receive money from';
        break;
      case RecordPaybillPymts:
        subtitle = 'These are the paybills you send money to';
        break;
      case RecordIncomingAgentDeposits:
        subtitle = 'This is where you deposit your money';
        break;
      case RecordOutgoingAgentWithdrawals:
        subtitle = 'This is where you withdraw your money';
        break;
    }
    return subtitle;
  }

  _typePicker(int index) {
    dynamic currentItem = listItems[index];
    // Check by type
    Type type = currentItem.runtimeType;

    switch (type) {
      case RecordP2PIncoming:
        titleKey = currentItem.name;
        amountKey = currentItem.amt;
        iconData = Icons.person;
        extraKey = null;
        break;
      case RecordP2POutgoing:
        titleKey = currentItem.name;
        amountKey = currentItem.amt;
        iconData = Icons.person;
        extraKey = null;
        break;
      case RecordPaybillsIncoming:
        titleKey = currentItem.b2CPaybillName;
        amountKey = currentItem.amt;
        extraKey = 'Paybill: ${currentItem.b2CPaybill}';
        iconData = Icons.business_outlined;
        break;
      case RecordPaybillPymts:
        titleKey = currentItem.paybillName;
        amountKey = currentItem.amt;
        extraKey = 'Paybill: ${currentItem.paybill}';
        iconData = Icons.business_outlined;
        break;
      case RecordIncomingAgentDeposits:
        titleKey = currentItem.tillOwner;
        amountKey = currentItem.amt;
        extraKey = 'Agent Number: ${currentItem.tillNos}';
        iconData = Icons.person;
        break;
      case RecordOutgoingAgentWithdrawals:
        titleKey = currentItem.tillOwner;
        amountKey = currentItem.amt;
        extraKey = 'Agent Number: ${currentItem.tillNos}';
        iconData = Icons.person;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Palette.backgroundWhite,
        elevation: 0,
        actions: [
          GlobalCircleButton(
            icon: Icons.cancel,
            color: Colors.black,
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: DeviceConfig.screenHeight! * 0.02),
            Text(
              '${_subtitlePicker(0)}',
              textAlign: TextAlign.center,
              style: Constants.blackBoldNormal.copyWith(
                fontSize: 18,
              ),
            ),
            SizedBox(height: DeviceConfig.screenHeight! * 0.02),
            Flexible(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(8),
                  vertical: getProportionateScreenHeight(8),
                ),
                itemCount: listItems.length,
                itemBuilder: (context, index) {
                  _typePicker(index);
                  return TransactionCard(
                    iconData: iconData,
                    titleKey: titleKey,
                    extraKey: extraKey,
                    amountKey: amountKey,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
