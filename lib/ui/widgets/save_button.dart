import 'package:family_economics/generated/l10n.dart';
import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final Function onPressed;
  const SaveButton({Key key, @required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
            padding: EdgeInsets.all(30),
            child: RaisedButton(
              onPressed: this.onPressed,
              child: Text(S.of(context).save),
              color: Theme.of(context).primaryColor,
            )));
  }
}
