import 'package:animations/animations.dart';
import 'package:ed_app/screens/category/category_screen.dart';
import 'package:ed_app/screens/main_screen/main_screen.dart';
import 'package:ed_app/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class BottomTabsScreen extends StatefulWidget {
  @override
  _BottomTabsScreenState createState() => _BottomTabsScreenState();
}

class _BottomTabsScreenState extends State<BottomTabsScreen> {
  int _currentIndex = 0;

  List<Widget> _pages = [MainScreen(), CategoryScreen()];

  var bottomNavigationBarItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: const Icon(Icons.home),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.category),
      label: "Categories",
    ),
  ];

  void _setPageIndex(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      body: PageTransitionSwitcher(
              child: _pages[_currentIndex],
              duration: Duration(milliseconds: 500),
              transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
                return FadeThroughTransition(
                    child: child,
                    animation: primaryAnimation,
                    secondaryAnimation: secondaryAnimation);
              },
            ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        items: bottomNavigationBarItems,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _setPageIndex,
      ),
    );
  }
}
