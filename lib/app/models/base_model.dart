import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseModel {
  String get entityCollectionName;
  DocumentReference reference;

  BaseModel.fromMap(Map<String, dynamic> map, {this.reference});

  BaseModel();

  Map<String, dynamic> toMap();
}
