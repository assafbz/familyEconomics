import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_economics/app/models/income.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class IncomesChart extends StatelessWidget {
  final formatCurrency = new NumberFormat.simpleCurrency();

  IncomesChart();

  Map<String, double> buildDataMap(List<Income> incomes, context) {
    final Map<String, double> dataMap = new Map<String, double>();
    incomes.forEach((element) {
      if (element.incomeType != null) {
        if (!dataMap.containsKey(element.incomeType)) {
          dataMap[element.incomeType] = 0;
        }
        dataMap[element.incomeType] += element.amount;
      }
    });

    dataMap.putIfAbsent(S.of(context).salary, () => 0);
    dataMap.putIfAbsent(S.of(context).yielding_asset, () => 0);
    dataMap.putIfAbsent(S.of(context).allowance, () => 0);
    return dataMap;
  }

  Widget buildPieChart(List<Income> incomes, context) {
    final Map<String, double> dataMap = buildDataMap(incomes, context);
    return PieChart(
      dataMap: dataMap,
      chartLegendSpacing: 20.0,
      showLegends: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(child: Container(
          child: Consumer<QuerySnapshot>(builder: (context, snapshot, child) {
        if (snapshot == null) return CircularProgressIndicator();
        List<Income> incomes =
            snapshot.documents.map((e) => Income.fromSnapshot(e)).toList();
        return buildPieChart(incomes, context);
      }))),
    );
  }
}
