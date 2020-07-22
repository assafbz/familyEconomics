import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_economics/app/models/loan.dart';
import 'package:family_economics/app/models/user.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:family_economics/ui/views/edit_loan/edit_loan.dart';
import 'package:family_economics/ui/views/loans_view/widgets/loan_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoansView extends StatefulWidget {
  @override
  LoansViewState createState() {
    return LoansViewState();
  }
}

class LoansViewState extends State<LoansView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(S.of(context).loans)),
        body: _buildBody(context),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EditLoan(new Loan()),
            ));
          },
          child: Icon(Icons.add),
          backgroundColor: Theme.of(context).primaryColor,
        ));
  }

  Widget _buildBody(BuildContext context) {
    final String email = Provider.of<User>(context, listen: false).email;
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('users')
          .document(email)
          .collection('loans')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Loan.fromSnapshot(data);
    return LoanCard(loan: record);
  }
}
