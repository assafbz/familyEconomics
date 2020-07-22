import 'package:family_economics/app/models/income.dart';
import 'package:family_economics/app/services/user_data_service.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:family_economics/ui/views/edit_income/widgets/income_type_dropdown.dart';
import 'package:family_economics/ui/widgets/number_text_field.dart';
import 'package:family_economics/ui/widgets/name_text_field.dart';
import 'package:family_economics/ui/widgets/save_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditIncome extends StatefulWidget {
  final Income income;

  EditIncome(this.income);

  @override
  EditIncomeState createState() {
    return EditIncomeState(this.income);
  }
}

class EditIncomeState extends State<EditIncome> {
  final _formKey = GlobalKey<FormState>();
  final Income income;

  EditIncomeState(this.income);

  void saveButtonClicked(context) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      UserDataService userDataService =
          Provider.of<UserDataService>(context, listen: false);
      userDataService.saveEntity(this.income);
      userDataService.calcUserCollectionSum('incomes', 'sum_of_incomes');
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
                AppBar(title: Text(S.of(context).incomes), actions: <Widget>[
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  context.read<UserDataService>().deleteEntity(this.income);
                  context
                      .read<UserDataService>()
                      .calcUserCollectionSum('incomes', 'sum_of_incomes');
                  Navigator.pop(context);
                },
              )
            ]),
            body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(children: <Widget>[
                  NameTextField(
                      onSaved: (val) => this.income.name = val,
                      initalValue: this.income.name,
                      label: S.of(context).income_name),
                  NumberTextField(
                      onSaved: (val) => this.income.amount = int.parse(val),
                      initialValue: this.income.amount,
                      label: S.of(context).amount),
                  IncomeTypeDropdown(income: this.income),
                  SaveButton(onPressed: () => saveButtonClicked(context)),
                ]))));
  }
}
