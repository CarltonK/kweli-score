import 'package:flutter/material.dart';
import 'package:kweliscore/helpers/helpers.dart';
import 'package:kweliscore/models/models.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:kweliscore/widgets/widgets.dart';

class SummaryBuilder extends StatefulWidget {
  const SummaryBuilder({Key? key, required this.summary}) : super(key: key);
  final QuickSummaries summary;

  @override
  _SummaryBuilderState createState() => _SummaryBuilderState();
}

class _SummaryBuilderState extends State<SummaryBuilder> {
  PageController? _controller;
  List<Widget> _pages = [];

  Map<String, double> chartIncomingTotalData() {
    Map<String, double> chartData = {};
    // Incoming Sources Total
    Map<String, IncomingSource> incomingSources =
        widget.summary.incomingSources!;
    IncomingSource total = incomingSources["1"] as IncomingSource;
    chartData.putIfAbsent('Mobiles', () => amountToDouble(total.fromMobiles!));
    chartData.putIfAbsent(
        'Paybills', () => amountToDouble(total.fromPaybills!));
    chartData.putIfAbsent('Agents', () => amountToDouble(total.fromAgents!));
    return chartData;
  }

  Map<String, double> chartIncomingTransactionsData() {
    Map<String, double> chartData = {};
    Map<String, IncomingSource> incomingSources =
        widget.summary.incomingSources!;
    IncomingSource total = incomingSources["2"] as IncomingSource;
    chartData.putIfAbsent('Mobiles', () => amountToDouble(total.fromMobiles!));
    chartData.putIfAbsent(
        'Paybills', () => amountToDouble(total.fromPaybills!));
    chartData.putIfAbsent('Agents', () => amountToDouble(total.fromAgents!));
    return chartData;
  }

  Map<String, double> chartOutgoingSources() {
    Map<String, double> chartData = {};
    Map<String, OutgoingSource> outgoingSources =
        widget.summary.outgoingSources!;
    OutgoingSource paybill = outgoingSources["1"] as OutgoingSource;
    OutgoingSource tills = outgoingSources["2"] as OutgoingSource;
    OutgoingSource mobiles = outgoingSources["3"] as OutgoingSource;
    OutgoingSource agents = outgoingSources["4"] as OutgoingSource;
    chartData.putIfAbsent('Paybills', () => amountToDouble(paybill.total!));
    chartData.putIfAbsent('Tills', () => amountToDouble(tills.total!));
    chartData.putIfAbsent('Mobiles', () => amountToDouble(mobiles.total!));
    chartData.putIfAbsent('Withdrawals', () => amountToDouble(agents.total!));
    return chartData;
  }

  Map<String, double> mpesaCharges() {
    Map<String, double> chartData = {};
    Map<String, MpesaCharge> chargeSources = widget.summary.mpesaCharges!;
    MpesaCharge paybillCharge = chargeSources["1"] as MpesaCharge;
    MpesaCharge p2pCharge = chargeSources["2"] as MpesaCharge;
    MpesaCharge agentCharge = chargeSources["3"] as MpesaCharge;
    MpesaCharge tillCharge = chargeSources["4"] as MpesaCharge;
    chartData.putIfAbsent(
        'Paybills', () => amountToDouble(paybillCharge.charge!));
    chartData.putIfAbsent('Tills', () => amountToDouble(tillCharge.charge!));
    chartData.putIfAbsent('Mobiles', () => amountToDouble(p2pCharge.charge!));
    chartData.putIfAbsent('Agents', () => amountToDouble(agentCharge.charge!));
    return chartData;
  }

  @override
  void initState() {
    super.initState();

    // Populate Pages
    _pages.add(GlobalPieChart(
      chartData: chartIncomingTotalData(),
      chartTitle: 'Incoming Total',
    ));
    _pages.add(GlobalPieChart(
      chartData: chartIncomingTransactionsData(),
      chartTitle: 'Incoming Transactions',
    ));
    _pages.add(GlobalPieChart(
      chartData: chartOutgoingSources(),
      chartTitle: 'Outgoing Sources',
    ));
    _pages.add(GlobalPieChart(
      chartData: mpesaCharges(),
      chartTitle: 'Mpesa Charges',
    ));
    _controller = PageController(viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(275),
      child: PageView.builder(
        controller: _controller,
        itemCount: _pages.length,
        physics: AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _pages[index];
        },
      ),
    );
  }
}
