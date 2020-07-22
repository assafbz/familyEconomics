import 'package:charts_flutter/flutter.dart' as charts;
import 'package:family_economics/app/models/user_data.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CashFlowData {
  final String cashFlowType;
  final int cashFlowAmount;
  final charts.Color color;

  CashFlowData(this.cashFlowType, this.cashFlowAmount, Color color)
      : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

class CashFlowChart extends StatelessWidget {
  final formatCurrency = new NumberFormat.simpleCurrency();

  CashFlowChart();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Consumer<UserData>(builder: (context, userData, child) {
        var data = [
          CashFlowData(S.of(context).incomes,
              userData?.sumOfIncomes?.toInt() ?? 0, Colors.green),
          CashFlowData(S.of(context).expenses,
              userData?.sumOfExpenses?.toInt() ?? 0, Colors.red),
        ];

        var series = [
          charts.Series(
            domainFn: (CashFlowData clickData, _) => clickData.cashFlowType,
            measureFn: (CashFlowData clickData, _) => clickData.cashFlowAmount,
            colorFn: (CashFlowData clickData, _) => clickData.color,
            id: 'CashFlowChart',
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
