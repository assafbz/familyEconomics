import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_economics/app/models/user_data.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:family_economics/ui/views/suggestions_view/suggestions_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SuggestionsCard extends StatelessWidget {
  SuggestionsCard();

  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    return Consumer<UserData>(builder: (context, userData, child) {
      return Center(
          child: new InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SuggestionsView()));
              },
              child: Card(
                  child: Column(children: <Widget>[
                ListTile(
                    leading: FaIcon(FontAwesomeIcons.bullseye, size: 40),
                    title: Text(
                      S.of(context).waiting_suggestions,
                      style: TextStyle(fontSize: 16),
                    ),
                    subtitle: StreamBuilder<QuerySnapshot>(
                        stream: Firestore.instance
                            .collection('suggestions')
                            .where("language", isEqualTo: locale.languageCode)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) return Text('0');
                          return Text(snapshot.data.documents.length.toString(),
                              style: Theme.of(context).textTheme.headline6);
                        }))
              ]))));
    });
  }
}
