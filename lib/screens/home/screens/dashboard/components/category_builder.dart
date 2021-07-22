import 'package:flutter/material.dart';
import 'package:kweliscore/models/models.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';

class CategoryBuilder extends StatefulWidget {
  const CategoryBuilder({
    Key? key,
    required this.p2pIncoming,
    required this.p2pOutgoing,
    required this.paybillIncoming,
    required this.paybillOutgoing,
    required this.agentDeposits,
    required this.agentWithdrawals,
  }) : super(key: key);
  final P2PIncoming p2pIncoming;
  final P2POutgoing p2pOutgoing;
  final PayBillsIncoming paybillIncoming;
  final PaybillPymts paybillOutgoing;
  final IncomingAgentDeposits agentDeposits;
  final OutgoingAgentWithdrawals agentWithdrawals;

  @override
  _CategoryBuilderState createState() => _CategoryBuilderState();
}

class _CategoryBuilderState extends State<CategoryBuilder> {
  PageController? _controller;
  List? displayItems, displayTags;

  @override
  void initState() {
    super.initState();

    displayItems = [
      widget.p2pIncoming,
      widget.p2pOutgoing,
      widget.paybillIncoming,
      widget.paybillOutgoing,
      widget.agentDeposits,
      widget.agentWithdrawals,
    ];

    displayTags = [
      'P2P Incoming',
      'P2P Outgoing',
      'Paybills Incoming',
      'Paybills Outgoing',
      'Agent Deposits',
      'Agent Withdrawals',
    ];

    _controller = PageController(viewportFraction: 0.8);
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    _controller!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(160),
      child: PageView.builder(
        itemCount: displayItems!.length,
        controller: _controller,
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          String total = displayItems![index].total;
          // Check the direction in which money flows
          // In if index % 2 == 0
          String moneyDirection = index % 2 == 0 ? 'received' : 'sent';

          return CategoryItem(
            title: displayTags![index],
            moneyDirection: moneyDirection,
            total: total,
            listItems: displayItems![index].records,
          );
        },
      ),
    );
  }
}
