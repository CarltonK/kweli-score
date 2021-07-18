import 'package:flutter/material.dart';
import 'package:kweliscore/utilities/utilities.dart';

class CategorySelector extends StatefulWidget {
  CategorySelector({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<String> categories;

  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(40),
      //Building a ListView
      child: ListView.builder(
          itemCount: widget.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  bottom: 5,
                  right: 20,
                ),
                child: Text(
                  widget.categories[index],
                  style: TextStyle(
                    color: index == selectedIndex
                        ? Palette.ksmartPrimary
                        : Palette.ksmartPrimary.withOpacity(.4),
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
