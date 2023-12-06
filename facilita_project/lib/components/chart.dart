import 'package:dio/dio.dart';
import 'package:facilita_project/data/models/financial_model.dart';
import 'package:facilita_project/data/repositories/financial_repository.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:rxdart/rxdart.dart';

class Chart extends StatefulWidget {
  const Chart({
    super.key,
  });

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  final financial = BehaviorSubject<FinancialModel>();
  final FinancialRepository repository = FinancialRepository(dio: Dio());

  @override
  void initState() {
    super.initState();
    getFinancialTotalizer();
  }

  getFinancialTotalizer() async {
    var result = await repository.getTotalizer();
    financial.add(result);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final colorList = <Color>[
      const Color.fromARGB(255, 20, 164, 77),
      const Color.fromARGB(255, 220, 76, 100),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: StreamBuilder<FinancialModel>(
          stream: financial,
          builder: (context, snapshot) {
            final dataMap = {
              "Depósito": snapshot.data?.totalIncome ?? 0,
              "Despesas": snapshot.data?.totalExpense ?? 0,
            };
            return PieChart(
              dataMap: dataMap.cast(),
              chartType: ChartType.ring,
              baseChartColor: const Color.fromARGB(255, 255, 255, 255),
              colorList: colorList,
              legendOptions: const LegendOptions(
                legendTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            );
          }),
    );
  }
}
