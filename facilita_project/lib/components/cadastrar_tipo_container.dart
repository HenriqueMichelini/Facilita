import 'package:flutter/material.dart';

class CadastrarTipoContainer extends StatefulWidget {
  const CadastrarTipoContainer({super.key});

  @override
  _CadastrarState createState() => _CadastrarState();
}

class _CadastrarState extends State<CadastrarTipoContainer> {
  int? _selectedValue;

  void _handleRadioValueChange(int? value) {
    setState(() {
      _selectedValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
