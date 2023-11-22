import 'package:facilita_project/components/extrato_cadastrar_button.dart';
import 'package:facilita_project/components/extrato_list_container.dart';
import 'package:facilita_project/components/extrato_select_type.dart';
import 'package:flutter/material.dart';
import 'package:facilita_project/components/date_container.dart';

class Extrato extends StatelessWidget {
  const Extrato({super.key});

  void openCadastrar(BuildContext context) {
    // Navigate to the Extrato page
    Navigator.pushNamed(context, '/cadastrar');
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
                const DateContainer(),
                const SizedBox(height: 10),
                const ExtratoSelectType(),
                const SizedBox(height: 10),
                const ExtratoListContainer(),
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
