import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:esoger/ui/theme/colors.dart';
import 'package:esoger/ui/screens/home/index.dart';
import 'package:esoger/ui/screens/school/index.dart';
import 'package:esoger/ui/screens/myplan/index.dart';
import 'package:esoger/ui/screens/profile/index.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const MyPlan(),
      SchoolScreen(),
      UserProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: secondaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.check_box),
        title: ("My plan"),
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: secondaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.school),
        title: ("School"),
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: secondaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: ("Profile"),
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: secondaryColor,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        stateManagement: true,
        items: _navBarsItems(),
        hideNavigationBarWhenKeyboardShows: true,
        navBarStyle: NavBarStyle
            .style1, // Choose the nav bar style with appropriate animation.
      ),
    );
  }
}
