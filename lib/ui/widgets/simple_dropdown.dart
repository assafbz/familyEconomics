import 'package:flutter/material.dart';

class SimpleDropdown extends StatefulWidget {
  final String value;
  final String label;
  final Function(dynamic) onChanged;
  final List<String> options;

  SimpleDropdown(
      {Key key, this.value, this.label, this.onChanged, this.options})
      : super(key: key);
  @override
  SimpleDropdownState createState() {
    return SimpleDropdownState(
        value: this.value,
        label: this.label,
        onChanged: this.onChanged,
        options: this.options);
  }
}

class SimpleDropdownState extends State<SimpleDropdown> {
  final String value;
  final String label;
  final Function(dynamic) onChanged;
  final List<String> options;

  SimpleDropdownState({this.value, this.label, this.onChanged, this.options});

  static List<DropdownMenuItem> getItems(List<String> options) {
    return options
        .map((String item) => DropdownMenuItem<String>(
            child: Row(
              children: <Widget>[
                Icon(Icons.category),
                SizedBox(width: 10),
                Text(
                  item,
                ),
              ],
            ),
            value: item))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      DropdownButtonFormField(
          icon: Icon(Icons.keyboard_arrow_down),
          value: this.value,
          decoration: InputDecoration(labelText: this.label),
          items: getItems(this.options),
          dropdownColor: Colors.amber[200],
          style: Theme.of(context).textTheme.button,
          onChanged: this.onChanged)
    ]);
  }
}
