import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Chart extends StatelessWidget {
  Chart({Key? key});

  final dataMap = <String, double>{
    "Flutter": 5,
  };

  final colorList = <Color>[
    Colors.greenAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: PieChart(
        dataMap: dataMap,
        chartType: ChartType.ring,
        baseChartColor: Colors.grey[300]!,
        colorList: colorList,
      ),
    );
  }
}
