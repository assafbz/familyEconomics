import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  int sumOfLiabilites;
  int sumOfAssets;
  int sumOfIncomes;
  int sumOfExpenses;
  int sumOfInsurances;
  int sumOfLoans;
  int sumOfGoals;
  DocumentReference reference;

  UserData() {
    this.sumOfLiabilites = 0;
    this.sumOfAssets = 0;
    this.sumOfIncomes = 0;
    this.sumOfExpenses = 0;
    this.sumOfInsurances = 0;
    this.sumOfLoans = 0;
    this.sumOfGoals = 0;
  }

  UserData.fromMap(Map<String, dynamic> map, {this.reference}) {
    this.sumOfLiabilites = map['sum_of_liabilities'];
    this.sumOfAssets = map['sum_of_assets'];
    this.sumOfIncomes = map['sum_of_incomes'];
    this.sumOfExpenses = map['sum_of_expenses'];
    this.sumOfInsurances = map['sum_of_insurances'];
    this.sumOfLoans = map['sum_of_loans'];
    this.sumOfGoals = map['sum_of_goals'];
  }

  UserData.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  void update() {
    reference.updateData(toMap());
  }

  @override
  String toString() => "UserData<$this.sumOfLiabilites:$this.sumOfAssets>";

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['sum_of_liabilities'] = this.sumOfLiabilites;
    map['sum_of_assets'] = this.sumOfAssets;
    map['sum_of_incomes'] = this.sumOfIncomes;
    map['sum_of_expenses'] = this.sumOfExpenses;
    map['sum_of_insurances'] = this.sumOfInsurances;
    map['sum_of_loans'] = this.sumOfLoans;
    map['sum_of_goals'] = this.sumOfGoals;
    return map;
  }
}
