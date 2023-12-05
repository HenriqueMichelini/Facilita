import 'dart:ffi';

import 'package:flutter/material.dart';

class ExtratoListTexts extends StatelessWidget {
  const ExtratoListTexts({
    super.key,
    required this.description,
    required this.type,
    required this.icon,
    required this.amount,
  });

  final String description;
  final String type;
  final String icon;
  final double amount;

  @override
  Widget build(BuildContext context) {
    Color textColor = (type == "DESPESA")
        ? const Color.fromARGB(255, 220, 76, 100)
        : const Color.fromARGB(255, 20, 164, 77);

    IconData iconData;

    if (icon == "airplanemode_active") {
      iconData = Icons.airplanemode_active;
    } else if (icon == "power") {
      iconData = Icons.power;
    } else if (icon == "credit_card") {
      iconData = Icons.credit_card;
    } else if (icon == "smartphone") {
      iconData = Icons.smartphone;
    } else if (icon == "fastfood") {
      iconData = Icons.fastfood;
    } else if (icon == "house") {
      iconData = Icons.house;
    } else {
      iconData = Icons.error;
    }

    return Row(
      children: [
        Icon(
          iconData,
          color: textColor,
          size: 24,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                description,
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'R\$ $amount}',
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
