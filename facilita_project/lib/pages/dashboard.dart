import 'package:flutter/material.dart';
import 'package:facilita_project/components/carteira_container.dart';
import 'package:facilita_project/components/chart_container.dart';
import 'package:facilita_project/components/extrato_button.dart';
import 'package:facilita_project/components/select_button.dart';
import 'package:facilita_project/services/auth_service.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  final String year = "2023";
  final String month = "Feve";

  void selectMonth() {}
  void selectYear() {}

  void openExtrato(BuildContext context) {
    // Navigate to the Extrato page
    Navigator.pushNamed(context, '/extrato');
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
                const SizedBox(height: 10),
                CarteiraContainer(),
                const SizedBox(height: 10),
                const ChartContainer(),
                const SizedBox(height: 20),
                ExtratoButton(
                  onTap: () => openExtrato(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
