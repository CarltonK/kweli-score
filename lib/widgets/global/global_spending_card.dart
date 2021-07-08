import 'package:flutter/material.dart';
import 'package:kweliscore/utilities/utilities.dart';

class SpendingCard extends StatelessWidget {
  const SpendingCard({
    Key? key,
    this.isIncoming = false,
    required this.name,
    required this.phoneNumber,
    required this.amount,
  }) : super(key: key);

  final bool isIncoming;
  final String name, phoneNumber, amount;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5,
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          backgroundColor:
              isIncoming ? Colors.lightGreen[100] : Colors.red[100],
          child: Icon(
            isIncoming ? Icons.arrow_downward : Icons.arrow_upward,
            color: isIncoming ? Colors.greenAccent[700] : Colors.red[900],
          ),
        ),
        title: Text(name),
        subtitle: Text(phoneNumber),
        trailing: Text(
          amount,
          style: TextStyle(
              color: isIncoming ? Colors.greenAccent[700] : Colors.red[900]),
        ),
      ),
    );
  }
}
