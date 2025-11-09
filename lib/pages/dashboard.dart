import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
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

  DateTime? _lastPressedAt;

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

  Future<bool> _onWillPop() async {
    // If not on home tab, go back to home tab first
    if (_controller.index != 0) {
      _controller.jumpToTab(0);
      return false;
    }

    // If on home tab, check for double press
    final now = DateTime.now();
    if (_lastPressedAt == null ||
        now.difference(_lastPressedAt!) > const Duration(seconds: 2)) {
      // First press or more than 2 seconds since last press
      _lastPressedAt = now;

      // Show snackbar message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'Press back again to exit',
            style: TextStyle(
              fontFamily: "Work Sans",
              fontWeight: FontWeight.w500,
            ),
          ),
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.all(16),
        ),
      );
      return false;
    }

    // Second press within 2 seconds - exit app
    SystemNavigator.pop();
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          stateManagement: true,
          items: _navBarsItems(),
          hideNavigationBarWhenKeyboardAppears: true,
          navBarStyle: NavBarStyle.style1, // Shows labels for all items always
          // Alternative styles that show all labels:
          // NavBarStyle.style3  - Labels always visible, icon above text
          // NavBarStyle.style6  - Labels always visible, icon and text side by side
          // NavBarStyle.style9  - Labels always visible, modern style
          // NavBarStyle.style12 - Labels always visible, Material 3 style
        ),
      ),
    );
  }
}

// Alternative: If you're using Flutter 3.12+, use PopScope instead
// Replace WillPopScope with:
/*
PopScope(
  canPop: false,
  onPopInvoked: (bool didPop) async {
    if (didPop) return;
    
    final shouldPop = await _onWillPop();
    if (shouldPop && context.mounted) {
      SystemNavigator.pop();
    }
  },
  child: Scaffold(
    body: PersistentTabView(...),
  ),
)
*/