import 'package:flutter/material.dart';
import 'package:kweliscore/models/models.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:kweliscore/widgets/widgets.dart';

class BrandsBuilder extends StatefulWidget {
  BrandsBuilder({
    Key? key,
    required this.categories,
    required this.brands,
  }) : super(key: key);

  final List<String> categories;
  final Brands brands;

  @override
  _BrandBuilderState createState() => _BrandBuilderState();
}

class _BrandBuilderState extends State<BrandsBuilder> {
  int? selectedIndex;
  int itemCount = 0;
  List<dynamic>? currentBrand;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(250),
      child: Column(
        children: [
          SizedBox(
            height: getProportionateScreenHeight(40),
            child: ListView.builder(
              itemCount: widget.categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => setState(() {
                    selectedIndex = index;
                    switch (selectedIndex) {
                      case 0:
                        currentBrand = widget.brands.petrolStations;
                        itemCount = currentBrand!.length;
                        return;
                      case 1:
                        currentBrand = widget.brands.restaurants;
                        itemCount = currentBrand!.length;
                        return;
                      case 2:
                        currentBrand = widget.brands.insurance;
                        itemCount = currentBrand!.length;
                        return;
                      case 3:
                        currentBrand = widget.brands.investPensionsSvngs;
                        itemCount = currentBrand!.length;
                        return;
                      case 4:
                        currentBrand = widget.brands.lifestyle;
                        itemCount = currentBrand!.length;
                        return;
                      case 5:
                        currentBrand = widget.brands.supermarkets;
                        itemCount = currentBrand!.length;
                        return;
                      case 6:
                        currentBrand = widget.brands.pharmacy;
                        itemCount = currentBrand!.length;
                        return;
                      // case 7:
                      //   currentBrand = widget.brands.homeInternetAndTv;
                      //   itemCount = currentBrand!.length;
                      //   return;
                    }
                  }),
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
                            : Palette.ksmartPrimary.withOpacity(.5),
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          selectedIndex != null
              ? Flexible(
                  child: itemCount != 0
                      ? ListView.builder(
                          itemCount: itemCount,
                          itemBuilder: (context, index) {
                            String transaction =
                                currentBrand![index].transactions == 1
                                    ? 'transaction'
                                    : 'transactions';
                            return Card(
                              elevation: 3,
                              child: ListTile(
                                leading: Icon(Icons.trending_flat),
                                title: Text(
                                  '${currentBrand![index].name}',
                                  style: Constants.boldSubheadlineStyle,
                                ),
                                isThreeLine: true,
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'KES ${currentBrand![index].spent}',
                                      style: Constants.boldSubheadlineStyle
                                          .copyWith(
                                        fontSize: 17,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            getProportionateScreenHeight(5)),
                                    Text(
                                      '${currentBrand![index].transactions} $transaction',
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      : GlobalInfoDialog(
                          message:
                              'No transactions recorded under this category',
                        ),
                )
              : GlobalSuccessDialog(
                  message: 'Tap a brand to get started',
                ),
        ],
      ),
    );
  }
}
