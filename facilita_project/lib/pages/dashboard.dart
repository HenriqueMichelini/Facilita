import 'package:flutter/material.dart';
import 'package:facilita_project/components/select_button.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}); // Corrected the constructor syntax

  void selectMonth() {}
  void selectYear() {}
  final String year = "2023";
  final String month = "Feve";

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
                  ],
                ),
                //  saldo
                const SizedBox(height: 25),
                Container(
                  color: const Color.fromARGB(255, 25, 43, 27),
                  height: 125,
                  alignment: Alignment.centerLeft,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          20, // Add horizontal padding to the entire Column
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceEvenly, // Distribute items evenly vertically
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Align items horizontally to the left
                      children: [
                        Text(
                          "Saldo: 100",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Despesas: 500",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Despesas: 500",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
