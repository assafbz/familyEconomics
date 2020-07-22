import 'package:family_economics/app/models/expense.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:family_economics/ui/widgets/simple_dropdown.dart';
import 'package:flutter/material.dart';

class ExpenseTypeDropdown extends StatefulWidget {
  final Expense expense;

  ExpenseTypeDropdown({Key key, this.expense}) : super(key: key);
  @override
  ExpenseTypeDropdownState createState() {
    return ExpenseTypeDropdownState(expense: this.expense);
  }
}

class ExpenseTypeDropdownState extends State<ExpenseTypeDropdown> {
  final Expense expense;

  ExpenseTypeDropdownState({this.expense});

  @override
  Widget build(BuildContext context) {
    if (this.expense.expenseType?.isEmpty ?? true) {
      this.expense.expenseType = S.of(context).credit_card;
    }
    return Column(children: <Widget>[
      SimpleDropdown(
          value: this.expense.expenseType,
          label: S.of(context).expense_type,
          options: <String>[
            S.of(context).credit_card,
            S.of(context).standing_order,
            S.of(context).bank_transfer,
            S.of(context).cash,
            S.of(context).check,
          ],
          onChanged: (value) {
            setState(() {
              this.expense.expenseType = value;
            });
          })
    ]);
  }
}
