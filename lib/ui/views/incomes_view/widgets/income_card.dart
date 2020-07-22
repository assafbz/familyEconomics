import 'package:family_economics/app/models/income.dart';
import 'package:family_economics/ui/views/edit_income/edit_income.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class IncomeCard extends StatelessWidget {
  final Income income;

  IncomeCard({this.income});

  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    final formatCurrency =
        NumberFormat.simpleCurrency(locale: locale.toString());
    return Center(
        child: new InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => EditIncome(this.income)));
      },
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
                leading: Icon(Icons.account_balance),
                title: Text(this.income.name),
                subtitle: Text('${formatCurrency.format(this.income.amount)}')),
          ],
        ),
      ),
    ));
  }
}
