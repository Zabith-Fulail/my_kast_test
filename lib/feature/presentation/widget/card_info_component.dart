import 'package:flutter/material.dart';

class CardInfoComponent extends StatelessWidget {
  final Widget? icon;
  final String? labelText;
  final String? value;

  const CardInfoComponent({
    super.key,
    this.icon,
    this.labelText,
    this.value,
  });

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
              child: icon,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                labelText ?? "",
                style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w400),
              ),
            ),
            Text(
              value ?? "",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



