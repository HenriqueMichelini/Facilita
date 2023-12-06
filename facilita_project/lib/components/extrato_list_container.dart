import 'package:dio/dio.dart';
import 'package:facilita_project/components/extrato_list_texts.dart';
import 'package:facilita_project/components/progress.dart';
import 'package:facilita_project/data/models/extract_model.dart';
import 'package:facilita_project/data/models/income_model.dart';
import 'package:facilita_project/data/repositories/extract_repository.dart';
import 'package:facilita_project/data/repositories/income_repository.dart';
import 'package:facilita_project/enums/extract_Type.dart';
import 'package:facilita_project/services/auth_service.dart';
import 'package:flutter/material.dart';

class ExtratoListContainer extends StatefulWidget {
  final DateTime startDate;
  final DateTime endDate;
  final int typeId;

  const ExtratoListContainer(
      {super.key,
      required this.startDate,
      required this.endDate,
      required this.typeId});

  @override
  State<ExtratoListContainer> createState() => _ExtratoListContainerState(
      startDate: startDate, endDate: endDate, typeId: typeId);
}

class _ExtratoListContainerState extends State<ExtratoListContainer> {
  final DateTime startDate;
  final DateTime endDate;
  final int typeId;

  _ExtratoListContainerState(
      {required this.startDate, required this.endDate, required this.typeId});

  @override
  void initState() {
    super.initState();
  }

  final ExtractRepository repository = ExtractRepository(dio: Dio());

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
              child: FutureBuilder<List<ExtractModel?>>(
                future: repository.getExtract(startDate, endDate, typeId),
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
                      final List<ExtractModel> incomes =
                          snapshot.data as List<ExtractModel>;
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          item![index]!.name,
                                          style: TextStyle(
                                            color: item![index]!.typeId == 1
                                                ? Color.fromARGB(
                                                    255, 20, 164, 77)
                                                : const Color.fromARGB(
                                                    255, 220, 76, 100),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'R\$ ${item[index]!.amount}',
                                        style: TextStyle(
                                          color: item![index]!.typeId == 1
                                              ? Color.fromARGB(255, 20, 164, 77)
                                              : const Color.fromARGB(
                                                  255, 220, 76, 100),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
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
