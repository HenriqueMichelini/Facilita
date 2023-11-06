import 'package:facilita_project/components/carteira_container.dart';
import 'package:facilita_project/components/chart_container.dart';
import 'package:facilita_project/components/extrato_button.dart';
import 'package:flutter/material.dart';
import 'package:facilita_project/components/select_button.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  final String year = "2023";
  final String month = "Feve";

  void selectMonth() {}
  void selectYear() {}
  void openExtrato() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 29, 31),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.start, // Align buttons at the start
              children: [
                const SizedBox(height: 20),
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
                    SelectButton(
                      onTap: () => context.read<AuthService>().logout(),
                      text: 'Sair',
                    ),
                  ],
                ),
                //  CARTEIRA CONTAINER
                const SizedBox(height: 10),
                const CarteiraContainer(),

                //  CHART CONTAINER
                const SizedBox(height: 10),
                const ChartContainer(),

                //  EXTRATO BUTTON
                const SizedBox(height: 20),
                ExtratoButton(onTap: openExtrato),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
