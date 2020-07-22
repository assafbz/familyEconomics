import 'package:family_economics/app/models/asset.dart';
import 'package:family_economics/app/services/user_data_service.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:family_economics/ui/views/edit_asset/widgets/asset_type_dropdown.dart';
import 'package:family_economics/ui/widgets/number_text_field.dart';
import 'package:family_economics/ui/widgets/name_text_field.dart';
import 'package:family_economics/ui/widgets/save_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditAsset extends StatefulWidget {
  final Asset asset;

  EditAsset(this.asset);

  @override
  EditAssetState createState() {
    return EditAssetState(this.asset);
  }
}

class EditAssetState extends State<EditAsset> {
  final _formKey = GlobalKey<FormState>();
  final Asset asset;

  EditAssetState(this.asset);

  String getAssetTypeValue() {
    if (this.asset?.assetType?.isEmpty ?? true) {
      return S.of(context).car;
    }
    return this.asset.assetType;
  }

  void saveButtonClicked(context) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      UserDataService userDataService =
          Provider.of<UserDataService>(context, listen: false);
      userDataService.saveEntity(asset);
      userDataService.calcUserCollectionSum('assets', 'sum_of_assets');
      Navigator.pop(context);
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Invalid')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Scaffold(
          appBar:
              AppBar(title: Text(S.of(context).edit_asset), actions: <Widget>[
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                context.read<UserDataService>().deleteEntity(this.asset);
                context
                    .read<UserDataService>()
                    .calcUserCollectionSum('assets', 'sum_of_assets');
                Navigator.pop(context);
              },
            )
          ]),
          body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(children: <Widget>[
                NameTextField(
                    onSaved: (val) => this.asset.name = val,
                    initalValue: this.asset.name,
                    label: S.of(context).asset_name),
                NumberTextField(
                    onSaved: (val) => this.asset.amount = int.parse(val),
                    initialValue: this.asset.amount,
                    label: S.of(context).asset_amount),
                SwitchListTile(
                    value: this.asset.isLiquid,
                    title: Text(S.of(context).liquid),
                    subtitle: Text(S.of(context).liquidity_explain),
                    onChanged: (value) {
                      setState(() {
                        this.asset.isLiquid = value;
                      });
                    }),
                SwitchListTile(
                    value: this.asset.isYielding,
                    title: Text(S.of(context).yielding),
                    subtitle: Text(S.of(context).yielding_explain),
                    onChanged: (value) {
                      setState(() {
                        this.asset.isYielding = value;
                      });
                    }),
                AssetTypeDropdown(asset: this.asset),
                SaveButton(onPressed: () => saveButtonClicked(context)),
              ])),
        ));
  }
}
