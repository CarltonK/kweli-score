import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kweliscore/utilities/utilities.dart';
import 'package:pie_chart/pie_chart.dart';

class GlobalPieChart extends StatelessWidget {
  GlobalPieChart({
    Key? key,
    required this.chartData,
    required this.chartTitle,
    this.canBeSelected = false,
  }) : super(key: key);
  final Map<String, double> chartData;
  final String chartTitle;
  final bool canBeSelected;

  _chartPressed(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(
          child: Text('Breakdown', style: Constants.boldHeadlineStyle),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        content: Container(
          height: DeviceConfig.screenHeight! * .3,
          width: DeviceConfig.screenWidth,
          child: ListView.builder(
            itemCount: chartData.length,
            itemBuilder: (context, index) => BreakdownCard(
              chartData: chartData,
              index: index,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      elevation: 2.5,
      margin: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(10),
        horizontal: getProportionateScreenWidth(5),
      ),
      child: InkWell(
        onTap: canBeSelected ? () => _chartPressed(context) : null,
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
                  IconButton(
                    onPressed:
                        canBeSelected ? () => _chartPressed(context) : null,
                    icon: Icon(
                      Icons.info,
                      color: Palette.ksmartPrimary,
                    ),
                  )
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
      ),
    );
  }
}

class BreakdownCard extends StatelessWidget {
  const BreakdownCard({
    Key? key,
    required this.chartData,
    required this.index,
  }) : super(key: key);

  final Map<String, double> chartData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.5,
      child: ListTile(
        isThreeLine: false,
        leading: CircleAvatar(
          child: Text(
            '${chartData.keys.toList()[index][0].toUpperCase()}',
            style: Constants.whiteBoldSubheadlineStyle,
          ),
          backgroundColor: Palette.ksmartPrimary,
        ),
        title: Text(
          '${chartData.keys.toList()[index]}',
        ),
        subtitle: Text(
          '${chartData.values.toList()[index]}',
          style: Constants.blackBoldNormal,
        ),
      ),
    );
  }
}
