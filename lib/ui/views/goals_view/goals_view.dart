import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_economics/app/models/goal.dart';
import 'package:family_economics/app/models/user.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:family_economics/ui/views/edit_goal/edit_goal.dart';
import 'package:family_economics/ui/views/goals_view/widgets/goals_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoalsView extends StatefulWidget {
  @override
  GoalsViewState createState() {
    return GoalsViewState();
  }
}

class GoalsViewState extends State<GoalsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(S.of(context).upcoming_year_goals)),
        body: _buildBody(context),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EditGoal(new Goal()),
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
          .collection('goals')
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
    final record = Goal.fromSnapshot(data);
    return GoalCard(goal: record);
  }
}
