import 'package:meta/meta.dart';

@immutable
class User {
  User({
    @required this.uid,
    this.email,
    this.photoUrl,
    this.displayName,
  });

  final String uid;
  String email;
  final String photoUrl;
  final String displayName;
}
