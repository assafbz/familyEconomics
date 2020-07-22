import 'package:family_economics/app/models/insurance.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:family_economics/ui/widgets/simple_dropdown.dart';
import 'package:flutter/material.dart';

class WhoInsuredDropdown extends StatefulWidget {
  final Insurance insurance;

  WhoInsuredDropdown({Key key, this.insurance}) : super(key: key);
  @override
  WhoInsuredDropdownState createState() {
    return WhoInsuredDropdownState(insurance: this.insurance);
  }
}

class WhoInsuredDropdownState extends State<WhoInsuredDropdown> {
  final Insurance insurance;

  WhoInsuredDropdownState({this.insurance});

  @override
  Widget build(BuildContext context) {
    if (this.insurance.whoIsInsured?.isEmpty ?? true) {
      this.insurance.whoIsInsured = S.of(context).all_family;
    }
    return Column(children: <Widget>[
      SimpleDropdown(
          value: this.insurance.whoIsInsured,
          label: S.of(context).who_is_insured,
          options: <String>[
            S.of(context).all_family,
            S.of(context).only_me,
            S.of(context).only_my_spouse,
            S.of(context).only_the_kids,
            S.of(context).me_and_my_spouse,
            S.of(context).me_and_the_kids
          ],
          onChanged: (value) {
            setState(() {
              this.insurance.whoIsInsured = value;
            });
          })
    ]);
  }
}
