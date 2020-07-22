import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_economics/app/models/base_model.dart';

class Loan extends BaseModel {
  String name;
  int amount;
  double interest;
  String loanType;
  int totalAmount;
  int numOfPayments;

  Loan() {
    name = "";
    amount = 0;
    interest = 0;
    totalAmount = 0;
    numOfPayments = 0;
    loanType = "";
  }

  Loan.fromMap(Map<String, dynamic> map, DocumentReference reference)
      : assert(map['name'] != null),
        name = map['name'],
        amount = map['amount'],
        interest = map['interest'],
        totalAmount = map['total_amount'],
        numOfPayments = map['num_of_payments'],
        loanType = map['loan_type'],
        super.fromMap(map, reference: reference);

  Loan.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, snapshot.reference);

  @override
  String toString() => "Loan<$name:$amount:$interest>";

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['name'] = name;
    map['amount'] = amount;
    map['interest'] = interest;
    map['total_amount'] = totalAmount;
    map['num_of_payments'] = numOfPayments;
    map['loan_type'] = loanType;
    return map;
  }

  @override
  String get entityCollectionName => "loans";
}
