import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_economics/app/models/expense.dart';
import 'package:family_economics/app/models/user.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:family_economics/ui/views/expenses_view/widgets/expenses_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../edit_expense/edit_expense.dart';
import 'widgets/expense_card.dart';

class ExpensesView extends StatefulWidget {
  @override
  ExpensesViewState createState() {
    return ExpensesViewState();
  }
}

class ExpensesViewState extends State<ExpensesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(S.of(context).expenses)),
        body: _buildBody(context),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EditExpense(new Expense()),
            ));
          },
          child: Icon(Icons.add),
          backgroundColor: Theme.of(context).primaryColor,
        ));
  }

  Widget _buildBody(BuildContext context) {
    final String email = Provider.of<User>(context, listen: false).email;
    return StreamProvider<QuerySnapshot>(
        create: (context) => Firestore.instance
            .collection('users')
            .document(email)
            .collection('expenses')
            .snapshots(),
        child: Column(children: <Widget>[
          ExpensesChart(),
          Expanded(child:
              Consumer<QuerySnapshot>(builder: (context, snapshot, child) {
            if (snapshot == null) return LinearProgressIndicator();
            return _buildList(context, snapshot.documents);
          }))
        ]));
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Expense.fromSnapshot(data);
    return ExpenseCard(expense: record);
  }
}
