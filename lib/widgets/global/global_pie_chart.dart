import 'package:flutter/material.dart';
import 'package:kweliscore/utilities/palette.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:pie_chart/pie_chart.dart';

class GlobalPieChart extends StatelessWidget {
  GlobalPieChart({
    Key? key,
    required this.chartData,
    required this.chartTitle,
  }) : super(key: key);
  final Map<String, double> chartData;
  final String chartTitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      elevation: 2.5,
      margin: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(10),
        horizontal: getProportionateScreenWidth(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  chartTitle,
                  style: Constants.kHeadlineStyle.copyWith(fontSize: 20),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.info))
              ],
            ),
          ),
          PieChart(
            dataMap: chartData,
            chartLegendSpacing: 2,
            initialAngleInDegree: 0,
            chartType: ChartType.disc,
            colorList: Palette.paletteColors,
            legendOptions: const LegendOptions(
              showLegendsInRow: false,
              legendPosition: LegendPosition.right,
              showLegends: true,
              legendShape: BoxShape.circle,
            ),
            chartValuesOptions: const ChartValuesOptions(
              showChartValueBackground: false,
              showChartValues: true,
              showChartValuesInPercentage: true,
              showChartValuesOutside: false,
            ),
          ),
        ],
      ),
    );
  }
}
