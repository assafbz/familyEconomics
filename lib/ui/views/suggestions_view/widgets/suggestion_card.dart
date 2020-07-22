import 'package:family_economics/app/models/suggestion.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SuggestionCard extends StatelessWidget {
  final Suggestion suggestion;

  SuggestionCard({this.suggestion});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: new InkWell(
        onTap: () async {
          if (this.suggestion.link != null) {
            bool canOpenLink = await canLaunch(this.suggestion.link);
            if (canOpenLink) {
              launch(this.suggestion.link);
            }
          }
        },
        child: Card(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: FaIcon(FontAwesomeIcons.handsHelping),
              title: Text(this.suggestion.title),
              subtitle: Text(this.suggestion.subtitle),
              trailing: Text(this.suggestion.category),
            )
          ],
        )),
      ),
    );
  }
}
