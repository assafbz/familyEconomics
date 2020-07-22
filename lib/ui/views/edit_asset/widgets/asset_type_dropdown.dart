import 'package:family_economics/app/models/asset.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:family_economics/ui/widgets/simple_dropdown.dart';
import 'package:flutter/material.dart';

class AssetTypeDropdown extends StatefulWidget {
  final Asset asset;

  AssetTypeDropdown({Key key, this.asset}) : super(key: key);
  @override
  AssetTypeDropdownState createState() {
    return AssetTypeDropdownState(asset: this.asset);
  }
}

class AssetTypeDropdownState extends State<AssetTypeDropdown> {
  final Asset asset;

  AssetTypeDropdownState({this.asset});

  @override
  Widget build(BuildContext context) {
    if (this.asset?.assetType?.isEmpty ?? true) {
      this.asset.assetType = S.of(context).car;
    }
    return Column(children: <Widget>[
      SimpleDropdown(
          value: this.asset.assetType,
          label: S.of(context).asset_type,
          options: <String>[
            S.of(context).car,
            S.of(context).foreign_exchange,
            S.of(context).gemel,
            S.of(context).house,
            S.of(context).invesment_account,
            S.of(context).manager_insurance,
            S.of(context).osh,
            S.of(context).pension,
            S.of(context).savings_account,
            S.of(context).work_fund
          ],
          onChanged: (value) {
            setState(() {
              this.asset.assetType = value;
            });
          })
    ]);
  }
}
