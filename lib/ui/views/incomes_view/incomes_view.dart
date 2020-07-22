import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_economics/app/models/income.dart';
import 'package:family_economics/app/models/user.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:family_economics/ui/views/incomes_view/widgets/income_card.dart';
import 'package:family_economics/ui/views/incomes_view/widgets/income_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../edit_income/edit_income.dart';

class IncomesView extends StatefulWidget {
  @override
  IncomesViewState createState() {
    return IncomesViewState();
  }
}

class IncomesViewState extends State<IncomesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(S.of(context).incomes)),
        body: _buildBody(context),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EditIncome(new Income()),
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
            .collection('incomes')
            .snapshots(),
        child: Column(children: <Widget>[
          IncomesChart(),
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
    final record = Income.fromSnapshot(data);
    return IncomeCard(income: record);
  }
}
