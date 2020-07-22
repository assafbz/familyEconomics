import 'package:family_economics/app/models/goal.dart';
import 'package:family_economics/ui/views/edit_goal/edit_goal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GoalCard extends StatelessWidget {
  final Goal goal;

  GoalCard({this.goal});

  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    final formatCurrency =
        NumberFormat.simpleCurrency(locale: locale.toString());
    return Center(
        child: new InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => EditGoal(this.goal)));
      },
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
                leading: Icon(Icons.account_balance),
                title: Text(this.goal.name),
                subtitle: Text('${formatCurrency.format(this.goal.amount)}')),
          ],
        ),
      ),
    ));
  }
}
