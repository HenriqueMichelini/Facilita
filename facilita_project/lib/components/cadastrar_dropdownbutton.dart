import 'package:flutter/material.dart';

class CadastrarDropDownButton extends StatefulWidget {
  const CadastrarDropDownButton({super.key});

  @override
  _CadastrarDropDownButtonState createState() =>
      _CadastrarDropDownButtonState();
}

class _CadastrarDropDownButtonState extends State<CadastrarDropDownButton> {
  String? _dropdownValue;

  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownValue = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: const [
        DropdownMenuItem<String>(
          value: "airplanemode_active",
          child: Row(
            children: <Widget>[
              Icon(Icons.airplanemode_active, color: Colors.white),
            ],
          ),
        ),
        DropdownMenuItem<String>(
          value: "power",
          child: Row(
            children: <Widget>[
              Icon(Icons.power, color: Colors.white),
            ],
          ),
        ),
        DropdownMenuItem<String>(
          value: "credit_card",
          child: Row(
            children: <Widget>[
              Icon(Icons.credit_card, color: Colors.white),
            ],
          ),
        ),
        DropdownMenuItem<String>(
          value: "smartphone",
          child: Row(
            children: <Widget>[
              Icon(Icons.smartphone, color: Colors.white),
            ],
          ),
        ),
        DropdownMenuItem<String>(
          value: "fastfood",
          child: Row(
            children: <Widget>[
              Icon(Icons.fastfood, color: Colors.white),
            ],
          ),
        ),
        DropdownMenuItem<String>(
          value: "house",
          child: Row(
            children: <Widget>[
              Icon(Icons.house, color: Colors.white),
            ],
          ),
        ),
      ],
      dropdownColor: Colors.blue,
      value: _dropdownValue,
      onChanged: dropdownCallback,
    );
  }
}
