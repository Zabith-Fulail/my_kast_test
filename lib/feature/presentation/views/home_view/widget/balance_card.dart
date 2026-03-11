import 'package:flutter/material.dart';



class BalanceCard extends StatelessWidget {
  final Map<String, dynamic> cardBalance;

  const BalanceCard({super.key, required this.cardBalance});


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[700],
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(cardBalance['currency'],style: TextStyle(color: Colors.white,fontSize: 16),),
              ),
              Text(cardBalance['availableBalance'],style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 32),),
            ],),
          Text(cardBalance['currencyType'],style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 18),),
        ],
      ),
    );
  }
}
