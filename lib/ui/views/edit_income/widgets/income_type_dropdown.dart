import 'package:family_economics/app/models/income.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:family_economics/ui/widgets/simple_dropdown.dart';
import 'package:flutter/material.dart';

class IncomeTypeDropdown extends StatefulWidget {
  final Income income;

  IncomeTypeDropdown({Key key, this.income}) : super(key: key);
  @override
  IncomeTypeDropdownState createState() {
    return IncomeTypeDropdownState(income: this.income);
  }
}

class IncomeTypeDropdownState extends State<IncomeTypeDropdown> {
  final Income income;

  IncomeTypeDropdownState({this.income});

  @override
  Widget build(BuildContext context) {
    if (this.income?.incomeType?.isEmpty ?? true) {
      this.income.incomeType = S.of(context).salary;
    }
    return Column(children: <Widget>[
      SimpleDropdown(
          value: this.income.incomeType,
          label: S.of(context).income_type,
          options: <String>[
            S.of(context).salary,
            S.of(context).yielding_asset,
            S.of(context).allowance,
          ],
          onChanged: (value) {
            setState(() {
              this.income.incomeType = value;
            });
          })
    ]);
  }
}
