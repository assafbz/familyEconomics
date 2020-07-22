import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class SumCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final int sum;
  final Widget navigateTo;

  SumCard({this.icon, this.title, this.sum, this.navigateTo});

  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);

    final formatCurrency =
        NumberFormat.simpleCurrency(locale: locale.toString());
    return Center(
        child: new InkWell(
            onTap: () {
              if (this.navigateTo != null) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => navigateTo));
              }
            },
            child: Card(
                child: Column(children: <Widget>[
              ListTile(
                  leading: FaIcon(this.icon, size: 40),
                  title: Text(
                    this.title,
                    style: TextStyle(fontSize: 16),
                  ),
                  subtitle: Text(
                    '${formatCurrency.format(this.sum)}',
                    style: Theme.of(context).textTheme.headline6,
                  ))
            ]))));
  }
}
