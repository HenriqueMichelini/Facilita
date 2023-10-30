import 'package:facilita_project/components/carteira_container.dart';
import 'package:facilita_project/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:facilita_project/components/select_button.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}); // Corrected the constructor syntax

  final String year = "2023";
  final String month = "Feve";

  void selectMonth() {}
  void selectYear() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Removed 'const' here
      backgroundColor: const Color.fromARGB(255, 20, 39, 22),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectButton(
                      onTap: selectMonth,
                      text: month,
                    ),
                    SelectButton(
                      onTap: selectYear,
                      text: year,
                    ),
                    const LogoutButton(),
                  ],
                ),
                //  saldo
                const SizedBox(height: 10),

                //  CARTEIRA CONTAINER
                const CarteiraContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
