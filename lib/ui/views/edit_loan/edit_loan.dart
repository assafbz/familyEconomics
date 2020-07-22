import 'package:family_economics/app/models/loan.dart';
import 'package:family_economics/app/services/user_data_service.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:family_economics/ui/views/edit_loan/widgets/loan_type_dropdown.dart';
import 'package:family_economics/ui/widgets/number_text_field.dart';
import 'package:family_economics/ui/widgets/name_text_field.dart';
import 'package:family_economics/ui/widgets/save_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditLoan extends StatefulWidget {
  final Loan loan;

  EditLoan(this.loan);

  @override
  EditLoanState createState() {
    return EditLoanState(this.loan);
  }
}

class EditLoanState extends State<EditLoan> {
  final _formKey = GlobalKey<FormState>();
  final Loan loan;

  EditLoanState(this.loan);

  String getLoanTypeValue() {
    if (this.loan?.loanType?.isEmpty ?? true) {
      return S.of(context).car;
    }
    return this.loan.loanType;
  }

  void saveButtonClicked(context) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      UserDataService userDataService =
          Provider.of<UserDataService>(context, listen: false);
      userDataService.saveEntity(loan);
      userDataService.calcUserCollectionSum('loans', 'sum_of_loans');
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
          appBar: AppBar(title: Text(S.of(context).loans), actions: <Widget>[
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                context.read<UserDataService>().deleteEntity(this.loan);
                context
                    .read<UserDataService>()
                    .calcUserCollectionSum('loans', 'sum_of_loans');
                Navigator.pop(context);
              },
            )
          ]),
          body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(children: <Widget>[
                NameTextField(
                    onSaved: (val) => this.loan.name = val,
                    initalValue: this.loan.name,
                    label: S.of(context).loan_name),
                NumberTextField(
                    onSaved: (val) => this.loan.amount = int.parse(val),
                    initialValue: this.loan.amount.toInt(),
                    label: S.of(context).monthly_payment),
                NumberTextField(
                    onSaved: (val) => this.loan.numOfPayments = int.parse(val),
                    initialValue: this.loan.numOfPayments,
                    label: S.of(context).payments_left),
                NumberTextField(
                    onSaved: (val) => this.loan.totalAmount = int.parse(val),
                    initialValue: this.loan.totalAmount.toInt(),
                    label: S.of(context).total_loan_amount),
                NumberTextField(
                    onSaved: (val) => this.loan.interest = double.parse(val),
                    initialValue: this.loan.interest.toInt(),
                    label: S.of(context).interest_rate),
                LoanTypeDropdown(loan: this.loan),
                SaveButton(onPressed: () => saveButtonClicked(context)),
              ])),
        ));
  }
}
