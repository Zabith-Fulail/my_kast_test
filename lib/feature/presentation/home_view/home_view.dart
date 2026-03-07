import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kast_test/feature/presentation/home_view/widget/balance_card.dart';
import 'package:kast_test/feature/presentation/widget/buttons/main_button.dart';
import 'package:kast_test/feature/presentation/widget/card_info_component.dart';

import '../widget/buttons/custom_button.dart';
import 'data/navigation_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;
  final List<Map<String, dynamic>> cardBalances = [
    {"availableBalance": "18 199.24", "currency": "\$", 'currencyType': "USD Dollar"},
    {"availableBalance": "12 654.24", "currency": "*", 'currencyType': "EUR Euro"},
  ];
  final List<Map<String, dynamic>> accounts = [
    {
      'accountNumber': '12332-543-134-123456',
      'balances': [
        {
          "balanceAmount": "12 000.00",
          "currencyType": "USD",
          "icon": Icons.attach_money_outlined,
        },
        {
          "balanceAmount": "19 000.00",
          "currencyType": "EUR",
          "icon": Icons.euro,
        },
      ],
    },
    {
      'accountNumber': '09875-543-134-567840',
      'balances': [
        {
          "balanceAmount": "98 000.00",
          "currencyType": "EUR",
          "icon": Icons.attach_money_outlined,
        },
        {
          "balanceAmount": "19 000.00",
          "currencyType": "GBP",
          "icon": Icons.currency_pound,
        },
      ],
    },
  ];
  final List<NavigationItem> navigationItems = [
    NavigationItem(icon: Icons.home_sharp),
    NavigationItem(icon: Icons.message),
    NavigationItem(icon: Icons.notification_important),
    NavigationItem(icon: Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://randomuser.me/api/portraits/men/75.jpg',
            ),
          ),
        ),
        actions: [Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Icon(Icons.search, size: 32, color: Colors.white),
        )],
      ),
      body: Container(
        color: Colors.blue[700],
        child: Column(
          children: [
            SizedBox(height: 32),
            _buildAccountCarousel(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MainButton(
                    width: 160,
                    height: 40,
                    fontSize: 15,
                    onPressed: () {},
                    text: "Add Money",
                  ),

                  MainButton(
                    width: 160,
                    height: 40,
                    fontSize: 15,
                    onPressed: () {},
                    text: "Exchange",
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(24),
                    topLeft: Radius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Accounts',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 20),
                      Column(
                        children: List.generate(accounts.length, (index) {
                          final account = accounts[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: ExpansionTile(
                              title: Text(account['accountNumber']),
                              leading: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade100,
                                  borderRadius: BorderRadiusGeometry.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.account_balance_wallet_outlined,
                                    color: Colors.blueAccent,
                                    size: 20,
                                  ),
                                ),
                              ),
                              backgroundColor: Colors.grey.shade50,
                              collapsedBackgroundColor: Colors.grey.shade100,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(8),
                              ),
                              collapsedShape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(8),
                              ),
                              children: [
                                ...account['balances'].map((subAccount) {
                                  return ListTile(
                                    leading: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.blue.shade100,
                                        borderRadius:
                                            BorderRadiusGeometry.circular(8),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(subAccount['icon'],color: Colors.blueAccent,),
                                      ),
                                    ),
                                    title: Text(
                                      "${subAccount['balanceAmount']} ${subAccount['currencyType']}",
                                    ),
                                  );
                                }),
                              ],
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Cards",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          AddCardBtn(
                            text: "+ ADD CARDS",
                            width: 80,
                            height: 24,
                            color: Colors.blue[100],
                            fontSize: 10,
                            textColor: Colors.blue,
                            onPressed: () {

                            },
                          ),
                        ],
                      ),
                      const CardInfoComponent(
                        icon: Icon(Icons.credit_card_rounded, color: Colors.blueAccent),
                        labelText: 'EUR +2330',
                        value: '8 199.24 EUR',
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 40,
        height: 40,
        child: FloatingActionButton(
          onPressed: () {},
          splashColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Padding(
              padding: EdgeInsets.all(4),
              child: CircleAvatar(
                radius: 55,
                backgroundColor: Colors.blueAccent,
                child: Icon(Icons.add_card, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(navigationItems.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  width: 70,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        navigationItems[index].icon,
                        size: 24,
                        color: selectedIndex == index
                            ? Colors.blue
                            : Colors.grey,
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildAccountCarousel() {
    return CarouselSlider(
      items: cardBalances.map((e) => BalanceCard(cardBalance: e)).toList(),
      options: CarouselOptions(
        autoPlayCurve: Curves.easeIn,
        autoPlay: true,
        height: 120,
      ),
    );
  }

}
