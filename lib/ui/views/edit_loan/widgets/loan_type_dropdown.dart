import 'package:family_economics/app/models/loan.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:family_economics/ui/widgets/simple_dropdown.dart';
import 'package:flutter/material.dart';

class LoanTypeDropdown extends StatefulWidget {
  final Loan loan;

  LoanTypeDropdown({Key key, this.loan}) : super(key: key);
  @override
  LoanTypeDropdownState createState() {
    return LoanTypeDropdownState(loan: this.loan);
  }
}

class LoanTypeDropdownState extends State<LoanTypeDropdown> {
  final Loan loan;

  LoanTypeDropdownState({this.loan});

  @override
  Widget build(BuildContext context) {
    if (this.loan.loanType?.isEmpty ?? true) {
      this.loan.loanType = S.of(context).car;
    }
    return Column(children: <Widget>[
      SimpleDropdown(
          value: this.loan.loanType,
          label: S.of(context).loan_type,
          options: <String>[S.of(context).car, S.of(context).purpose_free],
          onChanged: (value) {
            setState(() {
              this.loan.loanType = value;
            });
          })
    ]);
  }
}
