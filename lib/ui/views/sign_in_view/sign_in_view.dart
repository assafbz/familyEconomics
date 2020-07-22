import 'package:family_economics/app/services/firebase_auth_service.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:provider/provider.dart';
import 'sign_in_view_model.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignInViewModel>(
      create: (_) => SignInViewModel(context.read),
      builder: (_, child) {
        return const Scaffold(
          body: SignInViewBody._(),
        );
      },
    );
  }
}

class SignInViewBody extends StatelessWidget {
  const SignInViewBody._({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoading =
        context.select((SignInViewModel viewModel) => viewModel.isLoading);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).app_title),
      ),
      body: Center(
          child: Column(children: [
        Container(
            child: Padding(
                padding: EdgeInsets.fromLTRB(0, 200, 0, 0),
                child: Container(
                    decoration: BoxDecoration(border: Border.all()),
                    child: Image.asset('assets/images/euro.png',
                        height: 200, width: 200)))),
        Expanded(
            child: isLoading ? _loadingIndicator() : _signInButtons(context))
      ])),
    );
  }

  Center _loadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _signInButtons(BuildContext context) {
    return Consumer<FirebaseAuthService>(
        builder: (context, firebaseAuthService, child) {
      return Column(
        children: <Widget>[
          const Spacer(),
          FacebookSignInButton(
              onPressed: () => firebaseAuthService.signInWithFacebook(),
              text: S.of(context).facebook_login,
              splashColor: Colors.white),
          GoogleSignInButton(
              borderRadius: 10,
              onPressed: () => firebaseAuthService.signInWithGoogle(),
              splashColor: Colors.white,
              text: S.of(context).google_login,
              textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Roboto")),
          const Spacer(),
        ],
      );
    });
  }
}
