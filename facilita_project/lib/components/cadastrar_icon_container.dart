import 'package:flutter/material.dart';
import 'package:facilita_project/components/cadastrar_dropdownbutton.dart';

class CadastrarIconContainer extends StatelessWidget {
  const CadastrarIconContainer({Key? key}) : super(key: key);

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
            "Ícone",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          CadastrarDropDownButton(), // Assuming CadastrarDropDownButton is a valid widget
        ],
      ),
    );
  }
}
