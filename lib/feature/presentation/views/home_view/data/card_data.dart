import 'package:flutter/cupertino.dart';

class CardData {
  final String labelText;
  final Widget icon;
  final String availableBalance;

  CardData({
    required this.labelText,
    required this.icon,
    required this.availableBalance,
  });
}
