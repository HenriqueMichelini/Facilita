import 'package:dio/dio.dart';
import 'package:facilita_project/components/extrato_list_texts.dart';
import 'package:facilita_project/components/progress.dart';
import 'package:facilita_project/data/models/extract_model.dart';
import 'package:facilita_project/data/models/create_income_model.dart';
import 'package:facilita_project/data/repositories/extract_repository.dart';
import 'package:facilita_project/data/repositories/income_repository.dart';
import 'package:facilita_project/enums/extract_Type.dart';
import 'package:facilita_project/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

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
  State<ExtratoListContainer> createState() => _ExtratoListContainerState();
}

class _ExtratoListContainerState extends State<ExtratoListContainer> {
  
  final extract = BehaviorSubject<List<ExtractModel>>();

  _ExtratoListContainerState();

  @override
  void initState() {
    super.initState();
  }

  final ExtractRepository repository = ExtractRepository(dio: Dio());

  getExtract() async {
    extract.add([]);
    extract.add(await repository.getExtract(widget.startDate, widget.endDate, widget.typeId));
  }

  @override
  Widget build(BuildContext context) {
    getExtract();
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
              child: StreamBuilder<List<ExtractModel>>(
                stream: extract,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Progress();
                  }

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

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(
                      child: RefreshIndicator(
                        onRefresh: () => getExtract(),
                        child: ListView(
                          children: const [
                            Text(
                              'Nenhum item na lista',
                              style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  final incomes = snapshot.data!;
                  return RefreshIndicator(
                    onRefresh: () => getExtract(),
                    child: ListView.builder(
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
                                    child: SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Text(
                                        item![index]!.name,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: item[index]!.typeId == 1
                                              ? const Color.fromARGB(
                                                  255, 20, 164, 77)
                                              : const Color.fromARGB(
                                                  255, 220, 76, 100),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'R\$ ${item[index]!.amount}',
                                    style: TextStyle(
                                      color: item[index]!.typeId == 1
                                          ? const Color.fromARGB(
                                              255, 20, 164, 77)
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
                    )
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
