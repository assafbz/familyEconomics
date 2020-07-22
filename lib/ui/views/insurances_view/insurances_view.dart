import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_economics/app/models/insurance.dart';
import 'package:family_economics/app/models/user.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:family_economics/ui/views/edit_insurance/edit_insurance.dart';
import 'package:family_economics/ui/views/insurances_view/widgets/insurance_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InsurancesView extends StatefulWidget {
  @override
  InsurancesViewState createState() {
    return InsurancesViewState();
  }
}

class InsurancesViewState extends State<InsurancesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(S.of(context).insurances)),
        body: _buildBody(context),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EditInsurance(new Insurance()),
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
          .collection('insurances')
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
    final record = Insurance.fromSnapshot(data);
    return InsuranceCard(insurance: record);
  }
}
