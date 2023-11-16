import 'package:flutter/material.dart';

class ExtratoListContainer extends StatelessWidget {
  const ExtratoListContainer({super.key});

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
              height: 400,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            ),
          ),
        ],
      ),
    );
  }
}
