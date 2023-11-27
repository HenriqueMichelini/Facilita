import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CadastrarDate extends StatefulWidget {
  const CadastrarDate({super.key});

  @override
  _CadastrarDateState createState() => _CadastrarDateState();
}

class _CadastrarDateState extends State<CadastrarDate> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        )) ??
        selectedDate;

    if (picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);

    return TextButton(
      onPressed: () => _selectDate(context),
      child: Text(
        formattedDate,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
