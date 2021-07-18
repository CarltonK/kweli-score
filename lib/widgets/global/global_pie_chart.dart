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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              chartTitle,
              style: Constants.kHeadlineStyle.copyWith(fontSize: 20),
            ),
            PieChart(
              dataMap: chartData,
              chartLegendSpacing: 4,
              initialAngleInDegree: 0,
              chartType: ChartType.disc,
              colorList: Palette.paletteColors,
              legendOptions: LegendOptions(
                showLegendsInRow: false,
                legendPosition: LegendPosition.right,
                showLegends: true,
                legendShape: BoxShape.circle,
                legendTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              chartValuesOptions: ChartValuesOptions(
                showChartValueBackground: false,
                showChartValues: true,
                showChartValuesInPercentage: true,
                showChartValuesOutside: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
