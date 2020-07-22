import 'package:family_economics/app/models/asset.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:family_economics/ui/views/edit_asset/edit_asset.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AssetCard extends StatelessWidget {
  final Asset asset;

  AssetCard({this.asset});

  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    final formatCurrency =
        NumberFormat.simpleCurrency(locale: locale.toString());
    return Center(
        child: new InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => EditAsset(this.asset)));
      },
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
                leading: Icon(Icons.account_balance),
                title: Text(this.asset.name),
                subtitle: Text('${formatCurrency.format(this.asset.amount)}')),
            Row(
              children: [
                Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Theme.of(context).accentColor,
                    foregroundColor: Theme.of(context).primaryColor,
                    child: Icon(Icons.local_drink),
                  ),
                  label: Text(asset.isLiquid
                      ? S.of(context).liquid
                      : S.of(context).non_liquid),
                ),
                Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Theme.of(context).accentColor,
                    foregroundColor: Theme.of(context).primaryColor,
                    child: Icon(Icons.local_drink),
                  ),
                  label: Text(asset.isYielding
                      ? S.of(context).yielding
                      : S.of(context).not_yielding),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
