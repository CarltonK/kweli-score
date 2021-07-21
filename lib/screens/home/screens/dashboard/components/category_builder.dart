// import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kweliscore/models/models.dart';
// import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:kweliscore/widgets/widgets.dart';

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
  double? _animatedWidth;
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

    _controller = PageController(viewportFraction: 0.7);
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

          return GestureDetector(
            onTap: () {},
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              elevation: 3,
              margin: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(10),
                horizontal: getProportionateScreenWidth(5),
              ),
              color: Colors.grey[100],
              child: Container(
                width: getProportionateScreenWidth(250),
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${displayTags![index]}',
                          style: Constants.boldHeadlineStyle
                              .copyWith(fontSize: 20),
                        ),
                        GlobalCircleButton(
                          onPressed: () {},
                          icon: Icons.info,
                          color: Palette.ksmartPrimary,
                        ),
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(10)),
                    moneyDirection == 'received'
                        ? Icon(Icons.trending_up, color: Colors.green)
                        : Icon(Icons.trending_down, color: Colors.red),
                    SizedBox(height: getProportionateScreenHeight(10)),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'You have $moneyDirection a total of ',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: 'KES $total',
                            style: Constants.blackBoldNormal.copyWith(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
