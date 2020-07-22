import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_economics/app/models/expense.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class ExpensesChart extends StatelessWidget {
  final formatCurrency = new NumberFormat.simpleCurrency();

  ExpensesChart();

  Map<String, double> buildDataMap(List<Expense> expenses, context) {
    final Map<String, double> dataMap = new Map<String, double>();
    expenses.forEach((element) {
      if (!dataMap.containsKey(element.category)) {
        dataMap[element.category] = 0;
      }
      dataMap[element.category] += element.amount;
    });

    dataMap.putIfAbsent(S.of(context).household, () => 0);
    dataMap.putIfAbsent(S.of(context).kids, () => 0);
    dataMap.putIfAbsent(S.of(context).food, () => 0);
    dataMap.putIfAbsent(S.of(context).luxury, () => 0);
    dataMap.putIfAbsent(S.of(context).savings, () => 0);
    dataMap.putIfAbsent(S.of(context).transportation, () => 0);
    dataMap.putIfAbsent(S.of(context).media, () => 0);
    return dataMap;
  }

  Widget buildPieChart(List<Expense> expenses, context) {
    final Map<String, double> dataMap = buildDataMap(expenses, context);
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
        List<Expense> expenses =
            snapshot.documents.map((e) => Expense.fromSnapshot(e)).toList();
        return buildPieChart(expenses, context);
      }))),
    );
  }
}
