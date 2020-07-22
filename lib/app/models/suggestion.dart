import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_economics/app/models/base_model.dart';

class Suggestion extends BaseModel {
  String title;
  String category;
  String subtitle;
  String link;
  String language;

  Suggestion.fromMap(Map<String, dynamic> map, DocumentReference reference)
      : title = map['title'],
        category = map['category'],
        subtitle = map['subtitle'],
        link = map['link'],
        language = map['language'],
        super.fromMap(map, reference: reference);

  Suggestion.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, snapshot.reference);

  @override
  String toString() => "Suggestion<$title:$category:$subtitle:$link>";

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['title'] = title;
    map['category'] = category;
    map['subtitle'] = subtitle;
    map['link'] = link;
    map['language'] = language;
    return map;
  }

  @override
  String get entityCollectionName => "suggestions";
}
