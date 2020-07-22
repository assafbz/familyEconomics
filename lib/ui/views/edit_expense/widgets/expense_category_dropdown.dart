import 'package:family_economics/app/models/expense.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:family_economics/ui/widgets/simple_dropdown.dart';
import 'package:flutter/material.dart';

class ExpenseCategoryDropdown extends StatefulWidget {
  final Expense expense;

  ExpenseCategoryDropdown({Key key, this.expense}) : super(key: key);
  @override
  ExpenseCategoryDropdownState createState() {
    return ExpenseCategoryDropdownState(expense: this.expense);
  }
}

class ExpenseCategoryDropdownState extends State<ExpenseCategoryDropdown> {
  final Expense expense;

  ExpenseCategoryDropdownState({this.expense});

  @override
  Widget build(BuildContext context) {
    if (this.expense.category?.isEmpty ?? true) {
      this.expense.category = S.of(context).household;
    }
    return Column(children: <Widget>[
      SimpleDropdown(
          value: this.expense.category,
          label: S.of(context).category,
          options: <String>[
            S.of(context).household,
            S.of(context).kids,
            S.of(context).food,
            S.of(context).luxury,
            S.of(context).savings,
            S.of(context).transportation,
            S.of(context).media
          ],
          onChanged: (value) {
            setState(() {
              this.expense.category = value;
            });
          })
    ]);
  }
}
