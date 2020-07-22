import 'package:family_economics/app/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart' as buttons;
import 'package:provider/provider.dart';

class GoogleSignInButton2 extends StatelessWidget {
  const GoogleSignInButton2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buttons.GoogleSignInButton(
      onPressed: () {
        context.read<FirebaseAuthService>().signInWithGoogle();
      },
      darkMode: true,
      textStyle: TextStyle(
        fontSize: 14,
        color: Colors.white,
      ),
    );
  }
}
