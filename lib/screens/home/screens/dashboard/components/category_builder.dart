import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kweliscore/models/models.dart';
// import 'package:kweliscore/screens/screens.dart';
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
      height: getProportionateScreenHeight(100),
      child: PageView.builder(
        itemCount: 6,
        controller: _controller,
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          // Convert total String to double
          String total = displayItems![index].total;
          String totalFormatted = total.split(',').join();

          _animatedWidth = double.parse(totalFormatted);
          return GestureDetector(
            onTap: () {
              print(totalFormatted);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (BuildContext context) =>
              //         TabbedViewTransactions(title: 'Paybills'),
              //   ),
              // );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9),
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
                    Text(
                      '${displayTags![index]}',
                      style: Constants.boldHeadlineStyle.copyWith(fontSize: 20),
                    ),
                    SizedBox(height: getProportionateScreenHeight(10)),
                    AnimatedContainer(
                      curve: Constants.verySmoothCurve,
                      duration: Constants.fluidDuration,
                      height: 15,
                      width: _animatedWidth!,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Palette.ksmartPrimary,
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(10)),
                    Text(
                      'Total',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
                        color: Colors.black,
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
