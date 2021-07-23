import 'package:flutter/material.dart';
import 'package:kweliscore/utilities/utilities.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    Key? key,
    required this.iconData,
    required this.titleKey,
    required this.extraKey,
    required this.amountKey,
  }) : super(key: key);

  final IconData? iconData;
  final String? titleKey;
  final String? extraKey;
  final String? amountKey;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
        contentPadding: const EdgeInsets.all(8),
        leading: CircleAvatar(
          child: Text(
            '${titleKey![0].toUpperCase()}',
            style: Constants.whiteBoldSubheadlineStyle,
          ),
          backgroundColor: Palette.ksmartPrimary,
        ),
        title: Text(
          '$titleKey',
          style: Constants.boldSubheadlineStyle.copyWith(
            letterSpacing: .5,
            fontSize: 18,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            extraKey == null
                ? const SizedBox.shrink()
                : Text(
                    '$extraKey',
                    style: Constants.boldSubheadlineStyle.copyWith(
                      letterSpacing: .5,
                      fontSize: 16,
                    ),
                  ),
            SizedBox(height: getProportionateScreenHeight(8)),
            Text(
              'KES $amountKey',
              style: Constants.blackBoldNormal.copyWith(
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
