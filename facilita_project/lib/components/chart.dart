import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Chart extends StatelessWidget {
  Chart({Key? key});

  final dataMap = <String, double>{
    "Envios": 10,
    "Despesas": 5,
  };

  final colorList = <Color>[
    const Color.fromARGB(255, 20, 164, 77),
    const Color.fromARGB(255, 220, 76, 100),
  ];

  @override
  Widget build(BuildContext context) {
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
