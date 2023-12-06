import 'package:dio/dio.dart';
import 'package:facilita_project/components/cadastrar_button.dart';
import 'package:facilita_project/components/cadastrar_date.dart';
import 'package:facilita_project/components/cadastrar_date_container.dart';
import 'package:facilita_project/components/cadastrar_icon_container.dart';
import 'package:facilita_project/data/repositories/extract_repository.dart';
import 'package:facilita_project/pages/extrato.dart';
import 'package:flutter/material.dart';
import 'package:facilita_project/components/my_textfields.dart';
import 'package:facilita_project/components/cadastrar_tipo_container.dart';
import 'package:intl/intl.dart';

class Cadastrar extends StatefulWidget {
  const Cadastrar({super.key});

  @override
  _CadastrarState createState() => _CadastrarState();
}

class _CadastrarState extends State<Cadastrar> {
  int? _selectedValue = 1;

  final ExtractRepository repository = ExtractRepository(dio: Dio());

  void _handleRadioValueChange(int? value) {
    setState(() {
      _selectedValue = value;
    });
  }

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
    TextEditingController nomeCadastro = TextEditingController();
    TextEditingController valorCadastro = TextEditingController();
    String formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);

    _cadastrar() async {
      await repository.addIncomeExpense(_selectedValue, selectedDate,
          nomeCadastro.text, double.parse(valorCadastro.text));
      Navigator.of(context).pop(true);
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 29, 31),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
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
                  //Cadastro Tipo
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
                  //Cadastro Data
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
                          width:
                              200, // Set the width to 200 (you can adjust this value)
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromARGB(255, 6, 20, 18),
                          ),
                          height: 100,
                          child: Column(
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
                              TextButton(
                                onPressed: () => _selectDate(context),
                                child: Text(
                                  formattedDate,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ), // Assuming CadastrarDropDownButton is a valid widget
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  //imput Valor Descrição
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

                  GestureDetector(
                    onTap: _cadastrar,
                    child: Container(
                      padding: const EdgeInsets.all(25),
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 6, 20, 18),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          "Cadastrar",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
