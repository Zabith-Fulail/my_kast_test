import 'package:flutter/material.dart';
import 'package:kast_test/feature/presentation/views/home_view/data/card_data.dart';

class CardInfoComponent extends StatelessWidget {
  final CardData? cardData;

  const CardInfoComponent({super.key, this.cardData});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(8),
              child: cardData!.icon,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                cardData!.labelText,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Text(
              cardData!.availableBalance,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
