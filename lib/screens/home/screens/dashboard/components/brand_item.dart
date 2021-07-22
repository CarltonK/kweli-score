import 'package:flutter/material.dart';
import 'package:kweliscore/models/models.dart';
import 'package:kweliscore/utilities/utilities.dart';

class BrandItem extends StatelessWidget {
  const BrandItem({
    Key? key,
    required this.lifestyle,
  }) : super(key: key);
  final Lifestyle lifestyle;

  @override
  Widget build(BuildContext context) {
    String transaction =
        lifestyle.transactions == 1 ? 'transaction' : 'transactions';
    return Card(
      elevation: 1.5,
      child: ListTile(
        leading: Icon(
          Icons.trending_flat,
          color: Palette.ksmartPrimary,
        ),
        title: Text(
          '${lifestyle.name}',
          style: Constants.boldSubheadlineStyle,
        ),
        isThreeLine: true,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'KES ${lifestyle.spent}',
              style: Constants.boldSubheadlineStyle.copyWith(
                fontSize: 17,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(5)),
            Text(
              '${lifestyle.transactions} $transaction',
            ),
          ],
        ),
      ),
    );
  }
}
