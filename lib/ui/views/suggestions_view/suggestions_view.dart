import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_economics/app/models/suggestion.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:family_economics/ui/views/suggestions_view/widgets/suggestion_card.dart';
import 'package:flutter/material.dart';

class SuggestionsView extends StatefulWidget {
  @override
  SuggestionsViewState createState() {
    return SuggestionsViewState();
  }
}

class SuggestionsViewState extends State<SuggestionsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(S.of(context).suggestions)),
        body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('suggestions')
          .where("language", isEqualTo: locale.languageCode)
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
    final record = Suggestion.fromSnapshot(data);
    return SuggestionCard(suggestion: record);
  }
}
