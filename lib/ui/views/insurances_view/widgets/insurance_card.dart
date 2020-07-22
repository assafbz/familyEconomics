import 'package:family_economics/app/models/insurance.dart';
import 'package:family_economics/ui/views/edit_insurance/edit_insurance.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InsuranceCard extends StatelessWidget {
  final Insurance insurance;

  InsuranceCard({this.insurance});

  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    final formatCurrency =
        NumberFormat.simpleCurrency(locale: locale.toString());
    return Center(
        child: new InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditInsurance(this.insurance)));
      },
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
                leading: Icon(Icons.account_balance),
                title: Text(this.insurance.name),
                subtitle:
                    Text('${formatCurrency.format(this.insurance.amount)}')),
          ],
        ),
      ),
    ));
  }
}
