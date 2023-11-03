import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:facilita_project/components/chart.dart';

class ChartContainer extends StatelessWidget {
  const ChartContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 25, 43, 27),
              ),
              height: 400,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //  TITLE
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "DESPESAS x ENVIOS",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // CHART
                  Chart()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
