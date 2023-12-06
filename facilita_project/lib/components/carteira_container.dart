import 'package:dio/dio.dart';
import 'package:facilita_project/components/progress.dart';
import 'package:facilita_project/data/models/financial_model.dart';
import 'package:facilita_project/data/repositories/financial_repository.dart';
import 'package:flutter/material.dart';

class CarteiraContainer extends StatelessWidget {
  CarteiraContainer({super.key});

  final FinancialRepository repository = FinancialRepository(dio: Dio());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: FutureBuilder<FinancialModel?>(
          future: repository.getTotalizer(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return const Progress();
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                final item = snapshot.data;
                Row(
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
                              // Removed 'child' property here
                              child: const Text(
                                "CARTEIRA",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.account_balance_wallet_outlined,
                                    color: Colors.white),
                                SizedBox(width: 10), // Add some spacing
                                Text(
                                  "Saldo: R\$ ${item?.balance ?? '00.00'}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.arrow_circle_up_outlined,
                                    color: Colors.white),
                                SizedBox(width: 10), // Add some spacing
                                Text(
                                  "Depósitos: R\$ ${item?.totalIncome ?? '00.00'}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.arrow_circle_down_outlined,
                                    color: Colors.white),
                                SizedBox(width: 10), // Add some spacing
                                Text(
                                  "Despesas: R\$ ${item?.totalExpense ?? '00.00'}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
            }
            return const Text(
              'Nenhum item na lista',
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            );
          }),
    );
  }
}
