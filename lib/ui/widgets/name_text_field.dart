import 'package:family_economics/generated/l10n.dart';
import 'package:flutter/material.dart';

class NameTextField extends StatelessWidget {
  final Function(String) onSaved;
  final String label;
  final String initalValue;

  NameTextField({Key key, this.onSaved, this.label, this.initalValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        initialValue: this.initalValue,
        decoration: InputDecoration(labelText: this.label),
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value.isEmpty) {
            return S.of(context).asset_name_validaton;
          }
          return null;
        },
        onSaved: onSaved,
      ),
    );
  }
}
