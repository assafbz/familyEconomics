import 'package:charts_flutter/flutter.dart' as charts;
import 'package:family_economics/app/models/user_data.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NetWorthData {
  final String netWorthType;
  final int netWorthAmount;
  final charts.Color color;

  NetWorthData(this.netWorthType, this.netWorthAmount, Color color)
      : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

class NetWorthChart extends StatelessWidget {
  final formatCurrency = new NumberFormat.simpleCurrency();

  NetWorthChart();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Consumer<UserData>(builder: (context, userData, child) {
        var data = [
          NetWorthData(S.of(context).assets,
              userData?.sumOfAssets?.toInt() ?? 0, Colors.green),
          NetWorthData(S.of(context).liabilities,
              userData?.sumOfLiabilites?.toInt() ?? 0, Colors.red),
        ];

        var series = [
          charts.Series(
            domainFn: (NetWorthData clickData, _) => clickData.netWorthType,
            measureFn: (NetWorthData clickData, _) => clickData.netWorthAmount,
            colorFn: (NetWorthData clickData, _) => clickData.color,
            id: 'NetWorthChart',
            data: data,
          ),
        ];

        var chart = charts.BarChart(series, animate: true, vertical: false);

        var chartWidget = Padding(
          padding: EdgeInsets.all(20.0),
          child: SizedBox(
            height: 150.0,
            child: chart,
          ),
        );

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              chartWidget,
            ],
          ),
        );
      }),
    );
  }
}
