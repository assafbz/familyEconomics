import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_economics/app/models/base_model.dart';

class Insurance extends BaseModel {
  String name;
  String company;
  String insuranceType;
  String whoIsInsured;
  int amount;

  Insurance() {
    name = "";
    company = "";
    insuranceType = "";
    whoIsInsured = "";
    amount = 0;
  }

  Insurance.fromMap(Map<String, dynamic> map, ref)
      : assert(map['name'] != null),
        assert(map['amount'] != null),
        name = map['name'],
        company = map['company'],
        amount = map['amount'],
        insuranceType = map['insurance_type'],
        whoIsInsured = map['who_is_insured'],
        super.fromMap(map, reference: ref);

  Insurance.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, snapshot.reference);

  @override
  String toString() => "Insurance<$name:$insuranceType:$amount>";

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['name'] = name;
    map['company'] = company;
    map['amount'] = amount;
    map['insurance_type'] = insuranceType;
    map['who_is_insured'] = whoIsInsured;
    return map;
  }

  @override
  String get entityCollectionName => "insurances";
}
