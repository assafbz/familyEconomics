import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_economics/app/models/base_model.dart';

class Goal extends BaseModel {
  String name;
  int amount;

  Goal() {
    name = "";
    amount = 0;
  }

  Goal.fromMap(Map<String, dynamic> map, ref)
      : assert(map['name'] != null),
        assert(map['amount'] != null),
        name = map['name'],
        amount = map['amount'],
        super.fromMap(map, reference: ref);

  Goal.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, snapshot.reference);

  @override
  String toString() => "Insurance<$name:$amount>";

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['name'] = name;
    map['amount'] = amount;
    return map;
  }

  @override
  String get entityCollectionName => "goals";
}
