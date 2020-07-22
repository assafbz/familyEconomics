import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_economics/app/models/asset.dart';
import 'package:family_economics/app/models/user.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:family_economics/ui/views/assets_view/widgets/asset_card.dart';
import 'package:family_economics/ui/views/edit_asset/edit_asset.dart';
import 'package:family_economics/ui/widgets/info_banner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AssetsView extends StatefulWidget {
  @override
  AssetsViewState createState() {
    return AssetsViewState();
  }
}

class AssetsViewState extends State<AssetsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(S.of(context).assets)),
        body: _buildBody(context),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EditAsset(new Asset()),
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
          .collection('assets')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return Column(children: [
          InfoBanner(infoMessage: S.of(context).assets_info_banner),
          Expanded(child: _buildList(context, snapshot.data.documents))
        ]);
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
    final record = Asset.fromSnapshot(data);
    return AssetCard(asset: record);
  }
}
