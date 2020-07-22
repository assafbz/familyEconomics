import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_economics/app/models/base_model.dart';

class Asset extends BaseModel {
  String name;
  int amount;
  String assetType;
  bool isLiquid;
  bool isYielding;

  Asset() {
    isLiquid = false;
    isYielding = false;
    amount = 0;
    assetType = "";
    name = "";
  }

  Asset.fromMap(Map<String, dynamic> map, DocumentReference reference)
      : name = map['name'],
        assetType = map['asset_type'],
        amount = map['amount'],
        isLiquid = map['is_liquid'],
        isYielding = map['is_yielding'] ?? false,
        super.fromMap(map, reference: reference);

  Asset.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, snapshot.reference);

  @override
  String toString() => "Asset<$name:$assetType:$amount>";

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['name'] = name;
    map['asset_type'] = assetType;
    map['amount'] = amount;
    map['is_liquid'] = isLiquid;
    map['is_yielding'] = isYielding;
    return map;
  }

  @override
  String get entityCollectionName => "assets";
}
