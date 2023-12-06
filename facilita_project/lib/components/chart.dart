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
  late FinancialModel totalazer;

  @override
  void initState() {
    super.initState();
    //totalazer = getFinancialTotalizer();
  }

  getFinancialTotalizer() async {
    var result = await repository.getTotalizer();
    financial.add(result);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final dataMap = <String, double>{
      "Depósito": 25,
      "Despesas": 32,
    };

    final colorList = <Color>[
      const Color.fromARGB(255, 20, 164, 77),
      const Color.fromARGB(255, 220, 76, 100),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: PieChart(
        dataMap: dataMap,
        chartType: ChartType.ring,
        baseChartColor: const Color.fromARGB(255, 255, 255, 255),
        colorList: colorList,
        legendOptions: const LegendOptions(
          legendTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
