import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Chart extends StatelessWidget {
  const Chart({super.key});

  @override
  Widget build(BuildContext context) {
    final dataMap = <String, double>{
      "Envios": 6000,
      "Despesas": 4000,
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
