import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kweliscore/models/models.dart';
import 'package:kweliscore/utilities/utilities.dart';
// import 'package:kweliscore/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SwaraDash extends StatefulWidget {
  const SwaraDash({Key? key}) : super(key: key);

  @override
  _SwaraDashState createState() => _SwaraDashState();
}

class _SwaraDashState extends State<SwaraDash> {
  UserModel? user;
  DashboardResponse? dash;

  @override
  void initState() {
    super.initState();

    dash = context.read<DashboardResponse>();
    user = context.read<UserModel>();
  }

  String _name() {
    return user!.name!.split(' ')[0];
  }

  String _balance() {
    return dash!.detail!.usualBalance!;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        top: getProportionateScreenHeight(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello ${_name()},',
            style: Constants.kHeadlineStyle.copyWith(fontSize: 25),
          ),
          SizedBox(height: getProportionateScreenHeight(5)),
          Text(
            'Your usual balance is KES ${_balance()}',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 17),
          ),
        ],
      ),
    );
  }
}

// DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           bottom: TabBar(
//             indicatorColor: Palette.ksmartPrimary,
//             tabs: [
//               Tab(
//                 child: Text('Personal',
//                     style: Constants.kHeadlineStyle.copyWith(fontSize: 17)),
//               ),
//               Tab(
//                 child: Text('Paybill',
//                     style: Constants.kHeadlineStyle.copyWith(fontSize: 17)),
//               ),
//               Tab(
//                 child: Text('Agent',
//                     style: Constants.kHeadlineStyle.copyWith(fontSize: 17)),
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(children: [
//           SingleChildScrollView(
//             child: Container(
//               padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: getProportionateScreenHeight(10),
//                   ),
//                   Text('INCOMING', style: TextStyle(fontSize: 20)),
//                   Divider(
//                     height: 20,
//                     color: Colors.grey,
//                   ),
//                   SingleTransactionCard(
//                     isIncoming: true,
//                     phone: '0712345678',
//                     name: 'K-Smart User',
//                     amount: '17,500',
//                   ),
//                   SingleTransactionCard(
//                     isIncoming: true,
//                     phone: '0712345678',
//                     name: 'K-Smart User',
//                     amount: '17,500',
//                   ),
//                   SingleTransactionCard(
//                     isIncoming: true,
//                     phone: '0712345678',
//                     name: 'K-Smart User',
//                     amount: '17,500',
//                   ),
//                   SizedBox(
//                     height: getProportionateScreenHeight(15),
//                   ),
//                   Text('OUTGOING', style: TextStyle(fontSize: 20)),
//                   Divider(
//                     height: 20,
//                     color: Colors.grey,
//                   ),
//                   SingleTransactionCard(
//                     isIncoming: false,
//                     phone: '0712345678',
//                     name: 'K-Smart User',
//                     amount: '17,500',
//                   ),
//                   SingleTransactionCard(
//                     isIncoming: false,
//                     phone: '0712345678',
//                     name: 'K-Smart User',
//                     amount: '17,500',
//                   ),
//                   SingleTransactionCard(
//                     isIncoming: false,
//                     phone: '0712345678',
//                     name: 'K-Smart User',
//                     amount: '17,500',
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SingleChildScrollView(
//             child: Container(
//               padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: getProportionateScreenHeight(10),
//                   ),
//                   Text('INCOMING', style: TextStyle(fontSize: 20)),
//                   Divider(
//                     height: 20,
//                     color: Colors.grey,
//                   ),
//                   SingleTransactionCard(
//                     isIncoming: true,
//                     phone: '13456',
//                     name: 'Paybill Name',
//                     amount: '17,500',
//                   ),
//                   SingleTransactionCard(
//                     isIncoming: true,
//                     phone: '13456',
//                     name: 'Paybill Name',
//                     amount: '17,500',
//                   ),
//                   SingleTransactionCard(
//                     isIncoming: true,
//                     phone: '13456',
//                     name: 'Paybill Name',
//                     amount: '17,500',
//                   ),
//                   SizedBox(
//                     height: getProportionateScreenHeight(15),
//                   ),
//                   Text('OUTGOING', style: TextStyle(fontSize: 20)),
//                   Divider(
//                     height: 20,
//                     color: Colors.grey,
//                   ),
//                   SingleTransactionCard(
//                     isIncoming: false,
//                     phone: '13456',
//                     name: 'Paybill Name',
//                     amount: '17,500',
//                   ),
//                   SingleTransactionCard(
//                     isIncoming: false,
//                     phone: '13456',
//                     name: 'Paybill Name',
//                     amount: '17,500',
//                   ),
//                   SingleTransactionCard(
//                     isIncoming: false,
//                     phone: '13456',
//                     name: 'Paybill Name',
//                     amount: '17,500',
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SingleChildScrollView(
//             child: Container(
//               padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: getProportionateScreenHeight(10),
//                   ),
//                   Text('INCOMING', style: TextStyle(fontSize: 20)),
//                   Divider(
//                     height: 20,
//                     color: Colors.grey,
//                   ),
//                   SingleTransactionCard(
//                     isIncoming: true,
//                     phone: '815698',
//                     name: 'Agent Name',
//                     amount: '17,500',
//                   ),
//                   SingleTransactionCard(
//                     isIncoming: true,
//                     phone: '815698',
//                     name: 'Agent Name',
//                     amount: '17,500',
//                   ),
//                   SingleTransactionCard(
//                     isIncoming: true,
//                     phone: '815698',
//                     name: 'Agent Name',
//                     amount: '17,500',
//                   ),
//                   SizedBox(
//                     height: getProportionateScreenHeight(15),
//                   ),
//                   Text('OUTGOING', style: TextStyle(fontSize: 20)),
//                   Divider(
//                     height: 20,
//                     color: Colors.grey,
//                   ),
//                   SingleTransactionCard(
//                     isIncoming: false,
//                     phone: '815698',
//                     name: 'Agent Name',
//                     amount: '17,500',
//                   ),
//                   SingleTransactionCard(
//                     isIncoming: false,
//                     phone: '815698',
//                     name: 'Agent Name',
//                     amount: '17,500',
//                   ),
//                   SingleTransactionCard(
//                     isIncoming: false,
//                     phone: '815698',
//                     name: 'Agent Name',
//                     amount: '17,500',
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ]),
//       ),
//     )
