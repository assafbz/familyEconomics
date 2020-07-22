import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseAuthService({FirebaseAuth firebaseAuth, GoogleSignIn googleSignin})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignin ?? GoogleSignIn();

  User _userFromFirebase(FirebaseUser user) {
    if (user == null) {
      return null;
    }
    return User(
      uid: user.uid,
      email: user.email ?? user.providerData[1].email,
      displayName: user.displayName,
      photoUrl: user.photoUrl,
    );
  }

  Stream<User> get onAuthStateChanged {
    return _firebaseAuth.onAuthStateChanged.map(_userFromFirebase);
  }

  Future<User> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(authResult.user);
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final authResult = await _firebaseAuth.signInWithCredential(credential);
    User user = _userFromFirebase(authResult.user);
    return user;
  }

  Future<User> signInWithFacebook() async {
    FacebookLogin _facebookLogin = new FacebookLogin();
    bool isSignedIn = await _facebookLogin.isLoggedIn;
    String token;
    if (isSignedIn) {
      final FacebookAccessToken facebookAccessToken =
          await _facebookLogin.currentAccessToken;
      token = facebookAccessToken.token;
    } else {
      FacebookLoginResult facebookLoginResult =
          await _facebookLogin.logIn(['email']);
      token = facebookLoginResult.accessToken.token;
    }

    final credential = FacebookAuthProvider.getCredential(accessToken: token);
    final authResult = await _firebaseAuth.signInWithCredential(credential);
    User user = _userFromFirebase(authResult.user);
    return user;
  }

  void signInWithGoogleSilently() {
    _googleSignIn.signInSilently();
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Future<User> currentUser() async {
    final user = await _firebaseAuth.currentUser();
    return _userFromFirebase(user);
  }
}
