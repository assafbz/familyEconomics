import 'package:family_economics/app/models/insurance.dart';
import 'package:family_economics/app/services/user_data_service.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:family_economics/ui/views/edit_insurance/widgets/insurance_type_dropdown.dart';
import 'package:family_economics/ui/views/edit_insurance/widgets/who_insured_dropdown.dart';
import 'package:family_economics/ui/widgets/number_text_field.dart';
import 'package:family_economics/ui/widgets/name_text_field.dart';
import 'package:family_economics/ui/widgets/save_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditInsurance extends StatefulWidget {
  final Insurance insurance;

  EditInsurance(this.insurance);

  @override
  EditInsuranceState createState() {
    return EditInsuranceState(this.insurance);
  }
}

class EditInsuranceState extends State<EditInsurance> {
  final _formKey = GlobalKey<FormState>();
  final Insurance insurance;

  EditInsuranceState(this.insurance);

  String getInsuranceTypeValue() {
    if (this.insurance?.insuranceType?.isEmpty ?? true) {
      return S.of(context).car;
    }
    return this.insurance.insuranceType;
  }

  void saveButtonClicked(context) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      UserDataService userDataService =
          Provider.of<UserDataService>(context, listen: false);
      userDataService.saveEntity(insurance);
      userDataService.calcUserCollectionSum('insurances', 'sum_of_insurances');
      Navigator.pop(context);
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Invalid')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Scaffold(
          appBar:
              AppBar(title: Text(S.of(context).insurance), actions: <Widget>[
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                context.read<UserDataService>().deleteEntity(this.insurance);
                context
                    .read<UserDataService>()
                    .calcUserCollectionSum('insurances', 'sum_of_insurances');
                Navigator.pop(context);
              },
            )
          ]),
          body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(children: <Widget>[
                NameTextField(
                    onSaved: (val) => this.insurance.name = val,
                    initalValue: this.insurance.name,
                    label: S.of(context).insurance_name),
                NumberTextField(
                    onSaved: (val) => this.insurance.amount = int.parse(val),
                    initialValue: this.insurance.amount,
                    label: S.of(context).amount),
                NameTextField(
                    onSaved: (val) => this.insurance.company = val,
                    initalValue: this.insurance.company,
                    label: S.of(context).insurance_company),
                InsuranceTypeDropdown(insurance: this.insurance),
                WhoInsuredDropdown(insurance: this.insurance),
                SaveButton(onPressed: () => saveButtonClicked(context)),
              ])),
        ));
  }
}
