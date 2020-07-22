import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_economics/app/models/base_model.dart';

class Income extends BaseModel {
  String name;
  int amount;
  String incomeType;

  Income() {
    amount = 0;
    name = "";
    incomeType = "";
  }

  Income.fromMap(Map<String, dynamic> map, ref)
      : assert(map['name'] != null),
        assert(map['amount'] != null),
        name = map['name'],
        incomeType = map['income_type'],
        amount = map['amount'],
        super.fromMap(map, reference: ref);

  Income.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, snapshot.reference);

  @override
  String toString() => "Income<$name:$incomeType:$amount>";

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['name'] = name;
    map['income_type'] = incomeType;
    map['amount'] = amount;
    return map;
  }

  @override
  String get entityCollectionName => "incomes";
}
