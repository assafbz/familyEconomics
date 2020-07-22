import 'package:family_economics/app/models/goal.dart';
import 'package:family_economics/app/services/user_data_service.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:family_economics/ui/widgets/number_text_field.dart';
import 'package:family_economics/ui/widgets/name_text_field.dart';
import 'package:family_economics/ui/widgets/save_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditGoal extends StatefulWidget {
  final Goal goal;

  EditGoal(this.goal);

  @override
  EditGoalState createState() {
    return EditGoalState(this.goal);
  }
}

class EditGoalState extends State<EditGoal> {
  final _formKey = GlobalKey<FormState>();
  final Goal goal;

  EditGoalState(this.goal);

  void saveButtonClicked(context) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      UserDataService userDataService =
          Provider.of<UserDataService>(context, listen: false);
      userDataService.saveEntity(goal);
      userDataService.calcUserCollectionSum('goals', 'sum_of_goals');
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
              title: Text(S.of(context).upcoming_year_goals),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    context.read<UserDataService>().deleteEntity(this.goal);
                    context
                        .read<UserDataService>()
                        .calcUserCollectionSum('goals', 'sum_of_goals');
                    Navigator.pop(context);
                  },
                )
              ]),
          body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(children: <Widget>[
                NameTextField(
                    onSaved: (val) => this.goal.name = val,
                    initalValue: this.goal.name,
                    label: S.of(context).goal_name),
                NumberTextField(
                    onSaved: (val) => this.goal.amount = int.parse(val),
                    initialValue: this.goal.amount,
                    label: S.of(context).amount),
                SaveButton(onPressed: () => saveButtonClicked(context)),
              ])),
        ));
  }
}
