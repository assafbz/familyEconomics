import 'package:family_economics/app/models/insurance.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:family_economics/ui/widgets/simple_dropdown.dart';
import 'package:flutter/material.dart';

class InsuranceTypeDropdown extends StatefulWidget {
  final Insurance insurance;

  InsuranceTypeDropdown({Key key, this.insurance}) : super(key: key);
  @override
  InsuranceTypeDropdownState createState() {
    return InsuranceTypeDropdownState(insurance: this.insurance);
  }
}

class InsuranceTypeDropdownState extends State<InsuranceTypeDropdown> {
  final Insurance insurance;

  InsuranceTypeDropdownState({this.insurance});

  @override
  Widget build(BuildContext context) {
    if (this.insurance.insuranceType?.isEmpty ?? true) {
      this.insurance.insuranceType = S.of(context).life_insurance;
    }
    return Column(children: <Widget>[
      SimpleDropdown(
          value: this.insurance.insuranceType,
          label: S.of(context).insurance_type,
          options: <String>[
            S.of(context).life_insurance,
            S.of(context).health_insurance,
            S.of(context).work_insurance,
            S.of(context).car_insurance,
            S.of(context).disabled_insurance,
            S.of(context).teeth_insurance
          ],
          onChanged: (value) {
            setState(() {
              this.insurance.insuranceType = value;
            });
          })
    ]);
  }
}
