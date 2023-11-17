import 'package:facilita_project/components/cadastrar_dropdownbutton.dart';
import 'package:facilita_project/components/cadastrar_button.dart';
import 'package:flutter/material.dart';
import 'package:facilita_project/components/my_textfields.dart';

class Cadastrar extends StatefulWidget {
  const Cadastrar({Key? key}) : super(key: key);

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

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(255, 6, 20, 18),
                  ),
                  height: 175,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Container(
                        alignment: Alignment.center,
                        child: const Text(
                          "Tipo:",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // DEPÓSITOS
                      InkWell(
                        onTap: () {
                          _handleRadioValueChange(1);
                        },
                        child: Row(
                          children: [
                            const SizedBox(width: 15),
                            const Icon(
                              Icons.arrow_circle_up_outlined,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 15),
                            const Text(
                              "Depósito",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Radio(
                              value: 1,
                              groupValue: _selectedValue,
                              onChanged: _handleRadioValueChange,
                              activeColor: Colors.white,
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                      ),

                      // GASTOS
                      InkWell(
                        onTap: () {
                          _handleRadioValueChange(2);
                        },
                        child: Row(
                          children: [
                            const SizedBox(width: 15),
                            const Icon(
                              Icons.arrow_circle_down_outlined,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 15),
                            const Text(
                              "Gasto",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Radio(
                              value: 2,
                              groupValue: _selectedValue,
                              onChanged: _handleRadioValueChange,
                              activeColor: Colors.white,
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  "Ícone",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const CadastrarDropDownButton(),

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

                SizedBox(height: 200),

                CadastrarButton(onTap: _cadastrar)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _cadastrar() {}
