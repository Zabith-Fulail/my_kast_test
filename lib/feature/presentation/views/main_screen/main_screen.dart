import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kast_test/utils/routes/pages.dart';

class MainScreen extends StatefulWidget {
  final Widget child;

  const MainScreen({super.key, required this.child});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 40,
        height: 40,
        child: FloatingActionButton(
          onPressed: () {
            GoRouter.of(context).goNamed(Pages.counterScreen.toPathName());
          },
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
        backgroundColor: Colors.white,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          _navigate(selectedIndex);
        },

        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_sharp,
              color: selectedIndex == 0 ? Colors.blue : Colors.grey,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
              color: selectedIndex == 1 ? Colors.blue : Colors.grey,
            ),
            label: "Messages",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notification_important,
              color: selectedIndex == 2 ? Colors.blue : Colors.grey,
            ),
            label: "Notifications",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: selectedIndex == 3 ? Colors.blue : Colors.grey,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  void _navigate(int pageIndex) {
    switch (pageIndex) {
      case 0:
        GoRouter.of(context).goNamed(Pages.homeView.toPathName());
        break;
      case 1:
        GoRouter.of(context).goNamed(Pages.messageView.toPathName());
        break;
      case 2:
        GoRouter.of(context).goNamed(Pages.notificationView.toPathName());
        break;
      case 3:
        GoRouter.of(context).goNamed(Pages.profileView.toPathName());
        break;
      default:
        GoRouter.of(context).goNamed(Pages.homeView.toPathName());
    }
  }
}
