import 'package:flutter/material.dart';
import 'home_view/home_view.dart';
import 'message_view.dart';
import 'notification_view.dart';
import 'profile_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int selectedIndex = 0;

  final List<Widget> pages = [
    HomeView(),
    MessageView(),
    NotificationView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_sharp,color: selectedIndex == 0 ? Colors.blue : Colors.grey,),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message, color: selectedIndex == 1 ? Colors.blue : Colors.grey,),
            label: "Messages",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_important,color: selectedIndex == 2 ? Colors.blue : Colors.grey,),
            label: "Notifications",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: selectedIndex == 3 ? Colors.blue : Colors.grey,),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}