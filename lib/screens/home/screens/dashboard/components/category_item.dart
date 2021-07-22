import 'package:flutter/material.dart';
import 'package:kweliscore/screens/screens.dart';
import 'package:kweliscore/utilities/utilities.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.title,
    required this.total,
    required this.listItems,
    required this.moneyDirection,
  }) : super(key: key);

  final String total, moneyDirection, title;
  final List<dynamic> listItems;

  @override
  Widget build(BuildContext context) {
    _tapAction() {
      Navigator.of(context).push(
        SlideLeftTransition(
          page: ListedViewTransactions(
            listItems: listItems,
            title: title,
          ),
          routeName: '/view$title',
        ),
      );
    }

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      elevation: 2.5,
      margin: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(10),
        horizontal: getProportionateScreenWidth(5),
      ),
      child: InkWell(
        onTap: _tapAction,
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
                    '$title',
                    style: Constants.boldHeadlineStyle.copyWith(fontSize: 20),
                  ),
                  IconButton(
                    onPressed: _tapAction,
                    icon: moneyDirection == 'received'
                        ? Icon(Icons.trending_up, color: Colors.green, size: 35)
                        : Icon(
                            Icons.trending_down,
                            color: Colors.red,
                            size: 35,
                          ),
                  )
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'You have $moneyDirection a total of ',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
                        letterSpacing: .5,
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
  }
}
