import 'package:family_economics/app/models/liability.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:family_economics/ui/widgets/simple_dropdown.dart';
import 'package:flutter/material.dart';

class LiabilityTypeDropdown extends StatefulWidget {
  final Liability liability;

  LiabilityTypeDropdown({Key key, this.liability}) : super(key: key);
  @override
  LiabilityTypeDropdownState createState() {
    return LiabilityTypeDropdownState(liability: this.liability);
  }
}

class LiabilityTypeDropdownState extends State<LiabilityTypeDropdown> {
  final Liability liability;

  LiabilityTypeDropdownState({this.liability});

  @override
  Widget build(BuildContext context) {
    if (this.liability?.liabilityType?.isEmpty ?? true) {
      this.liability.liabilityType = S.of(context).loan;
    }
    return Column(children: <Widget>[
      SimpleDropdown(
          value: this.liability.liabilityType,
          label: S.of(context).liability_type,
          options: <String>[S.of(context).loan, S.of(context).mortgage],
          onChanged: (value) {
            setState(() {
              this.liability.liabilityType = value;
            });
          })
    ]);
  }
}
