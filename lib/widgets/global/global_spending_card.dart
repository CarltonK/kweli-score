import 'package:flutter/material.dart';
import 'package:kweliscore/utilities/utilities.dart';

class SpendingCard extends StatelessWidget {
  const SpendingCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        child: Row(
          children: [
            CircleAvatar(
              child: Icon(Icons.verified_user),
            ),
            SizedBox(width: getProportionateScreenWidth(15)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Mark Carlton'),
                SizedBox(height: getProportionateScreenHeight(7)),
                Container(
                  width: 150,
                  child: LinearProgressIndicator(
                    value: 0.8,
                    color: Palette.ksmartPrimary,
                    minHeight: 5,
                  ),
                ),
              ],
            ),
            SizedBox(width: getProportionateScreenWidth(15)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Ksh 15,000'),
                SizedBox(height: getProportionateScreenHeight(7)),
                Text(
                  '70%',
                  style: TextStyle(
                    color: Palette.ksmartPrimary,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
