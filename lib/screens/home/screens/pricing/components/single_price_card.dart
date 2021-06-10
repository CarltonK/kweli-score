import 'package:flutter/material.dart';
import 'package:kweliscore/utilities/utilities.dart';

class SinglePriceCard extends StatelessWidget {
  final int index;
  final PageController controller;
  const SinglePriceCard({
    Key? key,
    required this.index,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        double value = 1;
        if (controller.position.haveDimensions) {
          value = controller.page! - index;
          value = (1 - (value.abs() * 0.2)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 500,
            width: Curves.easeInOut.transform(value) * 400,
            child: child,
          ),
        );
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Palette.ksmartPrimary,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 30.0),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/images/wonder.png',
                    ),
                  ),
                ),
              ],
              fit: StackFit.expand,
            ),
          ),
          Positioned(
            bottom: 4,
            child: RawMaterialButton(
              padding: const EdgeInsets.all(15),
              onPressed: () {},
              shape: CircleBorder(),
              elevation: 2.0,
              fillColor: Colors.black.withOpacity(0.8),
              child: Icon(
                Icons.shopping_cart,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
