import 'package:family_economics/generated/l10n.dart';
import 'package:flutter/material.dart';

class NumberTextField extends StatelessWidget {
  final Function(String) onSaved;
  final int initialValue;
  final String label;

  NumberTextField({Key key, this.onSaved, this.initialValue, this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(labelText: this.label),
        keyboardType: TextInputType.number,
        initialValue: this.initialValue.toString(),
        validator: (value) {
          if (value.isEmpty) {
            return S.of(context).amount_validaton;
          }
          return null;
        },
        onSaved: onSaved,
      ),
    );
  }
}
