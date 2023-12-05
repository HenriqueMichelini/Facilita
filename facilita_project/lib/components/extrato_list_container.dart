import 'package:dio/dio.dart';
import 'package:facilita_project/components/extrato_list_texts.dart';
import 'package:facilita_project/components/progress.dart';
import 'package:facilita_project/data/models/income_model.dart';
import 'package:facilita_project/data/repositories/income_repository.dart';
import 'package:facilita_project/services/auth_service.dart';
import 'package:flutter/material.dart';

class ExtratoListContainer extends StatefulWidget {
  const ExtratoListContainer({super.key});

  @override
  State<ExtratoListContainer> createState() => _ExtratoListContainerState();
}

class _ExtratoListContainerState extends State<ExtratoListContainer> {
  final IncomeRepository repository = IncomeRepository(dio: Dio());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 6, 20, 18),
              ),
              height: 300,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: FutureBuilder<List<IncomeModel?>>(
                future: repository.getIncome(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      break;
                    case ConnectionState.waiting:
                      return const Progress();
                      break;
                    case ConnectionState.active:
                      break;
                    case ConnectionState.done:
                      final List<IncomeModel> incomes =
                          snapshot.data as List<IncomeModel>;
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            snapshot.error.toString(),
                            style: const TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        );
                      }

                      if (!snapshot.hasData) {
                        return const Center(
                          child: Text(
                            'Nenhum item na lista',
                            style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        );
                      } else {
                        return ListView.builder(
                          itemCount: incomes.length,
                          itemBuilder: (_, index) {
                            final item = snapshot.data;

                            return Row(
      children: [
        // Icon(
        //   Icons.fastfood,
        //   color: Color.fromARGB(255, 20, 164, 77),
        //   size: 24,
        // ),
        const SizedBox(width: 8),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  item![index]!.incomeName,
                  style: TextStyle(
                    color: Color.fromARGB(255, 20, 164, 77),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'R\$ ${item[index]!.incomeAmount}',
                style: TextStyle(
                  color: Color.fromARGB(255, 20, 164, 77),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );

                            // return Card(
                            //   child: ListTile(
                            //     leading: const Icon(Icons.monetization_on),
                            //     title: Text(
                            //       item![index]!.incomeName,
                            //       style: const TextStyle(
                            //         fontSize: 24.0,
                            //         fontWeight: FontWeight.bold,
                            //       ),
                            //     ),
                            //     subtitle: Text(
                            //       item![index]!.incomeAmount.toString(),
                            //       style: const TextStyle(
                            //         fontSize: 16.0,
                            //       ),
                            //     ),
                            //   ),
                            // );
                            // ExtratoListTexts(
                            //   icon: "fastfood",
                            //   description: item![index]!.incomeName,
                            //   type: "DEPOSITO",
                            //   amount: item![index]!.incomeAmount,
                            // );
                          },
                        );
                      }
                  }
                  ;
                  return const Text(
                    'Nenhum item na lista',
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
