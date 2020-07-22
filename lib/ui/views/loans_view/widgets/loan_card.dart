import 'package:family_economics/app/models/loan.dart';
import 'package:family_economics/ui/views/edit_loan/edit_loan.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LoanCard extends StatelessWidget {
  final Loan loan;

  LoanCard({this.loan});

  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    final formatCurrency =
        NumberFormat.simpleCurrency(locale: locale.toString());
    return Center(
        child: new InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => EditLoan(this.loan)));
      },
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
                leading: Icon(Icons.account_balance),
                title: Text(this.loan.name),
                subtitle: Text('${formatCurrency.format(this.loan.amount)}')),
          ],
        ),
      ),
    ));
  }
}
