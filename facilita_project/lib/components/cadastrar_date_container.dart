import 'package:facilita_project/components/cadastrar_date.dart';
import 'package:flutter/material.dart';

class CadastrarDateContainer extends StatelessWidget {
  const CadastrarDateContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // Set the width to 200 (you can adjust this value)
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromARGB(255, 6, 20, 18),
      ),
      height: 100,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Data",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          CadastrarDate(), // Assuming CadastrarDropDownButton is a valid widget
        ],
      ),
    );
  }
}
