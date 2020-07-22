import 'package:family_economics/app/models/expense.dart';
import 'package:family_economics/app/services/user_data_service.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:family_economics/ui/views/edit_expense/widgets/expense_category_dropdown.dart';
import 'package:family_economics/ui/views/edit_expense/widgets/expense_type_dropdown.dart';
import 'package:family_economics/ui/widgets/number_text_field.dart';
import 'package:family_economics/ui/widgets/name_text_field.dart';
import 'package:family_economics/ui/widgets/save_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditExpense extends StatefulWidget {
  final Expense expense;

  EditExpense(this.expense);

  @override
  EditExpenseState createState() {
    return EditExpenseState(this.expense);
  }
}

class EditExpenseState extends State<EditExpense> {
  final _formKey = GlobalKey<FormState>();
  final Expense expense;

  EditExpenseState(this.expense);

  void saveButtonClicked(context) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      UserDataService userDataService =
          Provider.of<UserDataService>(context, listen: false);
      userDataService.saveEntity(this.expense);
      userDataService.calcUserCollectionSum('expenses', 'sum_of_expenses');
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Scaffold(
            appBar:
                AppBar(title: Text(S.of(context).expenses), actions: <Widget>[
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  context.read<UserDataService>().deleteEntity(this.expense);
                  context
                      .read<UserDataService>()
                      .calcUserCollectionSum('expenses', 'sum_of_expenses');
                  Navigator.pop(context);
                },
              )
            ]),
            body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(children: <Widget>[
                  NameTextField(
                      onSaved: (val) => this.expense.name = val,
                      initalValue: this.expense.name,
                      label: S.of(context).expense_name),
                  NumberTextField(
                      onSaved: (val) => this.expense.amount = int.parse(val),
                      initialValue: this.expense.amount,
                      label: S.of(context).amount),
                  ExpenseCategoryDropdown(expense: this.expense),
                  ExpenseTypeDropdown(expense: this.expense),
                  SaveButton(onPressed: () => saveButtonClicked(context)),
                ]))));
  }
}
