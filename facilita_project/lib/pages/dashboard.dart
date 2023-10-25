import 'package:flutter/material.dart';
import 'package:facilita_project/components/select_button.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}); // Corrected the constructor syntax

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
                      text: "Feve",
                    ),
                    //const SizedBox(width: 1),
                    SelectButton(
                      onTap: selectYear,
                      text: "2024",
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
