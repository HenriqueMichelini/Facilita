import 'package:facilita_project/components/extrato_cadastrar_button.dart';
import 'package:facilita_project/components/extrato_list_container.dart';
import 'package:facilita_project/components/extrato_select_type.dart';
import 'package:facilita_project/enums/extract_Type.dart';
import 'package:flutter/material.dart';
import 'package:facilita_project/components/date_container.dart';

class Extrato extends StatefulWidget {
  const Extrato({Key? key}) : super(key: key);

  @override
  _ExtratoState createState() => _ExtratoState();
}

class _ExtratoState extends State<Extrato> {
  late DateTime _selectedDate;
  late DateTime _startDate;
  late DateTime _endDate;

  @override
  void initState() {
    super.initState();
    // _selectedDate = DateTime.now();
    // _startDate = DateTime(DateTime.now().year, DateTime.now().month, 1);
    // _endDate = DateTime.now();
  }

  void openCadastrar(BuildContext context) {
    // Navigate to the Extrato page
    Navigator.pushNamed(context, '/cadastrar');
  }

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStartDate ? _startDate : _endDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != (isStartDate ? _startDate : _endDate)) {
        if (isStartDate) {
          setState(() => _startDate = picked);
        } else {
          setState(() => _endDate = picked);
        }
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 29, 31),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              //  icons to use:
              //  1 airplanemode_active_outlined
              //  2 fastfood
              //  3 shopping_cart_rounded
              //  4 directions_car
              //  5 monetization_on
              //  6 mobile_friendly
              //  7 people_alt
              //  8 wb_incandescent
              //  9 house
              //  10 water_drop
              //  11 web
              //  12 credit_card
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromARGB(255, 6, 20, 18),
                          ),
                          height: 175,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: const Text(
                                  "Apartir de quando?",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.hourglass_empty,
                                      color: Colors.white),
                                  SizedBox(width: 10),
                                  TextButton(
                                    onPressed: () => _selectDate(context, true),
                                    child: Text(
                                      "Início: ${_startDate.day}/${_startDate.month}/${_startDate.year}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.hourglass_full,
                                      color: Colors.white),
                                  SizedBox(width: 10),
                                  TextButton(
                                    onPressed: () =>
                                        _selectDate(context, false),
                                    child: Text(
                                      "Fim: ${_endDate.day}/${_endDate.month}/${_endDate.year}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const ExtratoSelectType(),
                const SizedBox(height: 10),
                ExtratoListContainer(startDate: _startDate, endDate: _endDate, typeId: 0),
                const SizedBox(height: 10),
                ExtratoCadastrarButton(onTap: () => openCadastrar(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
