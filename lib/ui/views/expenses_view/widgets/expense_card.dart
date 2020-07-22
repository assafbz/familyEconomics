import 'package:family_economics/app/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../edit_expense/edit_expense.dart';

class ExpenseCard extends StatelessWidget {
  final Expense expense;

  ExpenseCard({this.expense});

  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    final formatCurrency =
        NumberFormat.simpleCurrency(locale: locale.toString());
    return Center(
        child: new InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => EditExpense(this.expense)));
      },
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
                leading: Icon(Icons.account_balance),
                title: Text(this.expense.name),
                subtitle: Text('${formatCurrency.format(this.expense.amount)}'))
          ],
        ),
      ),
    ));
  }
}
