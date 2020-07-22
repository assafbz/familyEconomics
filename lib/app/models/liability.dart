import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_economics/app/models/base_model.dart';

class Liability extends BaseModel {
  String name;
  int amount;
  String liabilityType;

  Liability() {
    name = "";
    amount = 0;
    liabilityType = "";
  }

  Liability.fromMap(Map<String, dynamic> map, DocumentReference ref)
      : assert(map['name'] != null),
        assert(map['amount'] != null),
        name = map['name'],
        liabilityType = map['liability_type'],
        amount = map['amount'],
        super.fromMap(map, reference: ref);

  Liability.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, snapshot.reference);

  @override
  String toString() => "Liability<$name:$liabilityType:$amount>";

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['name'] = name;
    map['liability_type'] = liabilityType;
    map['amount'] = amount;
    return map;
  }

  @override
  String get entityCollectionName => "liabilities";
}
