import 'package:facilita_project/components/cadastrar_button.dart';
import 'package:facilita_project/components/cadastrar_date_container.dart';
import 'package:facilita_project/components/cadastrar_icon_container.dart';
import 'package:flutter/material.dart';
import 'package:facilita_project/components/my_textfields.dart';
import 'package:facilita_project/components/cadastrar_tipo_container.dart';

class Cadastrar extends StatefulWidget {
  const Cadastrar({super.key});

  @override
  _CadastrarState createState() => _CadastrarState();
}

class _CadastrarState extends State<Cadastrar> {
  int? _selectedValue;

  void _handleRadioValueChange(int? value) {
    setState(() {
      _selectedValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nomeCadastro = TextEditingController();
    TextEditingController valorCadastro = TextEditingController();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 29, 31),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Title
                const Text(
                  "CADASTRAR",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                const CadastrarTipoContainer(),

                const SizedBox(height: 30),

                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: CadastrarIconContainer(),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: CadastrarDateContainer(),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                Column(
                  children: [
                    MyTextFields(
                      controller: nomeCadastro,
                      hintText: "Descrição",
                      obscureText: false,
                    ),
                    const SizedBox(height: 15),
                    MyTextFields(
                      controller: valorCadastro,
                      hintText: "Valor",
                      obscureText: false,
                    ),
                  ],
                ),

                const SizedBox(height: 180),

                const CadastrarButton(onTap: _cadastrar)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _cadastrar() {}
