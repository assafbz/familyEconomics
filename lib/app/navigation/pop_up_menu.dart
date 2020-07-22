import 'package:family_economics/app/services/firebase_auth_service.dart';
import 'package:family_economics/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopUpMenu extends StatelessWidget {
  const PopUpMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (result) {
        switch (result) {
          case 'Settings':
            break;
          case 'Log Out':
            context.read<FirebaseAuthService>().signOut();
            break;
          default:
            break;
        }
      },
      itemBuilder: (context) => [
        // PopupMenuItem(
        //   value: 'Settings',
        //   child: Text(S.of(context).settings),
        // ),
        PopupMenuItem(
          value: 'Log Out',
          child: Text(S.of(context).log_out),
        ),
      ],
    );
  }
}
