import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_economics/app/models/base_model.dart';
import 'package:family_economics/app/models/user_data.dart';

abstract class UserDataService {
  String email;
  Stream<UserData> onUserDataChanged();
  Future<void> calcUserCollectionSum(
      String collectionName, String fieldToUpdate);
  void saveEntity(BaseModel entity);

  void deleteEntity(BaseModel entity);

  void handleFirstLogin();
}

class UserDataServiceFirebase extends UserDataService {
  UserDataServiceFirebase();

  @override
  void saveEntity(BaseModel entity) {
    if (entity.reference != null) {
      entity.reference.updateData(entity.toMap());
    } else {
      Firestore.instance
          .collection('users')
          .document(email)
          .collection(entity.entityCollectionName)
          .add(entity.toMap())
          .then((value) => entity.reference = value);
    }
  }

  void handleFirstLogin() async {
    DocumentSnapshot doc =
        await Firestore.instance.collection('users').document(email).get();
    if (!doc.exists) {
      UserData userData = new UserData();
      Firestore.instance
          .collection('users')
          .document(email)
          .setData(userData.toMap());
    }
  }

  @override
  void deleteEntity(BaseModel entity) {
    if (entity.reference != null) {
      entity.reference.delete();
    }
  }

  @override
  Stream<UserData> onUserDataChanged() {
    return Firestore.instance
        .collection('users')
        .document(email)
        .snapshots()
        .map((snapshot) => UserData.fromSnapshot(snapshot));
  }

  @override
  Future<void> calcUserCollectionSum(
      String collectionName, String fieldToUpdate) async {
    QuerySnapshot documents = await Firestore.instance
        .collection('users')
        .document(email)
        .collection(collectionName)
        .getDocuments();
    int totalSum = 0;
    for (DocumentSnapshot doc in documents.documents) {
      totalSum += doc.data['amount'];
    }
    Firestore.instance
        .collection('users')
        .document(email)
        .updateData({fieldToUpdate: totalSum});
  }
}
