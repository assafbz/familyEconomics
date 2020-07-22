import 'package:family_economics/app/services/firebase_auth_service.dart';
import 'package:family_economics/app/services/user_data_service.dart';
import 'package:family_economics/app/themes/main_theme.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:family_economics/ui/views/assets_view/assets_view.dart';
import 'package:family_economics/ui/views/sign_in_view/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/user.dart';
import 'navigation/navigation.dart';

class EconomyApplication extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  final UserDataService userDataService = UserDataServiceFirebase();

  Widget buildByUid(String email) {
    if (email?.isEmpty ?? true) {
      return const SignInView();
    } else {
      userDataService.email = email;
      userDataService.handleFirstLogin();
      return MainNavigationBar(
          EconomyApplication.analytics, EconomyApplication.observer);
    }
  }

  Widget buildMaterialApp(context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      onGenerateTitle: (BuildContext context) => S.of(context).title,
      theme: theme,
      debugShowCheckedModeBanner: false,
      navigatorObservers: <NavigatorObserver>[observer],
      home: Scaffold(body: Consumer<User>(builder: (_, user, __) {
        return buildByUid(user?.email);
      })),
      routes: {'/assets': (context) => AssetsView()},
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Consumer<FirebaseAuthService>(
                builder: (context, firebaseAuthService, child) {
              firebaseAuthService.signInWithGoogleSilently();
              return Provider<SharedPreferences>.value(
                  value: snapshot.data,
                  child: Provider<UserDataService>.value(
                      value: userDataService,
                      child: buildMaterialApp(context)));
            });
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
