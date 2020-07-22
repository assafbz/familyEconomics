import 'package:family_economics/app/models/liability.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:family_economics/ui/views/edit_liability/edit_liability.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class LiabilityCard extends StatelessWidget {
  final Liability liability;

  LiabilityCard({this.liability});

  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    final formatCurrency =
        NumberFormat.simpleCurrency(locale: locale.toString());
    return Center(
        child: new InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditLiability(this.liability)));
      },
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
                leading: FaIcon(FontAwesomeIcons.handHoldingUsd),
                title: Text(this.liability.name),
                subtitle:
                    Text('${formatCurrency.format(this.liability.amount)}')),
          ],
        ),
      ),
    ));
  }
}
