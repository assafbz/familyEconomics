import 'package:family_economics/app/models/user_data.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class AssetsLiabilitiesChart extends StatelessWidget {
  final formatCurrency = new NumberFormat.simpleCurrency();

  AssetsLiabilitiesChart();

  @override
  Widget build(BuildContext context) {
    return Center(child: Card(
      child: Container(
          child: Consumer<UserData>(builder: (context, userData, child) {
        final Map<String, double> dataMap = new Map();
        double sumOfAssets = 10;
        double sumOfLiabilities = 10;
        if (userData != null) {
          sumOfAssets = userData.sumOfAssets.toDouble();
          sumOfLiabilities = userData.sumOfLiabilites.toDouble();
        }

        dataMap.putIfAbsent(S.of(context).assets, () => sumOfAssets);
        dataMap.putIfAbsent(S.of(context).liabilities, () => sumOfLiabilities);

        return PieChart(
          dataMap: dataMap,
          chartLegendSpacing: 10.0,
          showLegends: true,
          colorList: [Colors.green[300], Colors.red[300]],
        );
      })),
    ));
  }
}
