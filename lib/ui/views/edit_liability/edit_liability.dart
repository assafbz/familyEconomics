import 'package:family_economics/app/models/liability.dart';
import 'package:family_economics/app/services/user_data_service.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:family_economics/ui/views/edit_liability/widgets/liability_type_dropdown.dart';
import 'package:family_economics/ui/widgets/number_text_field.dart';
import 'package:family_economics/ui/widgets/name_text_field.dart';
import 'package:family_economics/ui/widgets/save_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditLiability extends StatefulWidget {
  final Liability liability;

  EditLiability(this.liability);

  @override
  EditLiabilityState createState() {
    return EditLiabilityState(this.liability);
  }
}

class EditLiabilityState extends State<EditLiability> {
  final _formKey = GlobalKey<FormState>();
  final Liability liability;

  EditLiabilityState(this.liability);

  void saveButtonClicked(context) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      UserDataService userDataService =
          Provider.of<UserDataService>(context, listen: false);
      userDataService.saveEntity(this.liability);
      userDataService.calcUserCollectionSum(
          'liabilities', 'sum_of_liabilities');

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
            appBar: AppBar(
                title: Text(S.of(context).liabilities),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      context
                          .read<UserDataService>()
                          .deleteEntity(this.liability);
                      context.read<UserDataService>().calcUserCollectionSum(
                          'liabilities', 'sum_of_liabilities');
                      Navigator.pop(context);
                    },
                  )
                ]),
            body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(children: <Widget>[
                  NameTextField(
                      onSaved: (val) => this.liability.name = val,
                      initalValue: this.liability.name,
                      label: S.of(context).liability_name),
                  NumberTextField(
                      onSaved: (val) => this.liability.amount = int.parse(val),
                      initialValue: this.liability.amount,
                      label: S.of(context).amount),
                  LiabilityTypeDropdown(liability: liability),
                  SaveButton(onPressed: () => saveButtonClicked(context)),
                ]))));
  }
}
