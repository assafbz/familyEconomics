import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_economics/app/models/base_model.dart';

class Expense extends BaseModel {
  String name;
  int amount;
  String expenseType;
  String category;
  bool isPermanent;

  Expense() {
    amount = 0;
    isPermanent = false;
    name = "";
    expenseType = "";
    category = "";
  }

  Expense.fromMap(Map<String, dynamic> map, ref)
      : assert(map['name'] != null),
        assert(map['amount'] != null),
        name = map['name'],
        expenseType = map['expense_type'],
        amount = map['amount'],
        category = map['category'],
        isPermanent = map['is_permanent'] ?? false,
        super.fromMap(map, reference: ref);

  Expense.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, snapshot.reference);

  @override
  String toString() => "Expense<$name:$expenseType:$amount>";

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['name'] = name;
    map['expense_type'] = expenseType;
    map['amount'] = amount;
    map['category'] = category;
    map['is_permanent'] = isPermanent;
    return map;
  }

  @override
  String get entityCollectionName => "expenses";
}
