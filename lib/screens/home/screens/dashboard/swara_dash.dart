import 'package:flutter/material.dart';
import 'package:kweliscore/models/models.dart';
import 'package:kweliscore/screens/screens.dart';
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

  _buildLocations() {
    List<String> locations = dash!.detail!.quickSummaries!.yourTopLocations!;
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Based on your transactions, you are likely to be within ',
            style: Constants.blackBoldNormal.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          TextSpan(
            text: '${locations.join(', ')}.',
            style: Constants.blackBoldNormal.copyWith(fontSize: 20),
          ),
        ],
      ),
    );
  }

  _buildBalance() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Your usual balance is ',
            style: Constants.blackBoldNormal.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 17,
            ),
          ),
          TextSpan(
            text: ' ~ KES ${dash!.detail!.usualBalance}',
            style: Constants.blackBoldNormal.copyWith(fontSize: 20),
          ),
        ],
      ),
    );
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
          ...[
            IntroWidget(
              name: user!.name!,
              expiryDate: dash!.detail!.expiryDate!,
              period: dash!.detail!.statement!,
              records: dash!.detail!.records!,
            )
          ],
          Text('Quick Summary', style: Constants.kHeadlineStyle),
          SizedBox(height: getProportionateScreenHeight(10)),
          _buildBalance(),
          SizedBox(height: getProportionateScreenHeight(10)),
          _buildLocations(),
          SizedBox(height: getProportionateScreenHeight(20)),
          SummaryBuilder(summary: dash!.detail!.quickSummaries!),
          SizedBox(height: getProportionateScreenHeight(25)),
          Text('Transactional Data', style: Constants.kHeadlineStyle),
          SizedBox(height: getProportionateScreenHeight(10)),
          CategoryBuilder(
            p2pIncoming: dash!.detail!.p2PIncoming!,
            p2pOutgoing: dash!.detail!.p2POutgoing!,
            paybillIncoming: dash!.detail!.payBillsIncoming!,
            paybillOutgoing: dash!.detail!.paybillPymts!,
            agentDeposits: dash!.detail!.incomingAgentDeposits!,
            agentWithdrawals: dash!.detail!.outgoingAgentWithdrawals!,
          ),
          SizedBox(height: getProportionateScreenHeight(25)),
          Text('Top Brands', style: Constants.kHeadlineStyle),
          SizedBox(height: getProportionateScreenHeight(10)),
          BrandsBuilder(
            categories: [
              'Petrol Stations',
              'Restaurants',
              'Insurance',
              'Investments',
              'Lifestyle',
              'Supermarkets',
              'Pharmacy',
              'Internet and TV',
            ],
            brands: dash!.detail!.brands!,
          )
        ],
      ),
    );
  }
}
