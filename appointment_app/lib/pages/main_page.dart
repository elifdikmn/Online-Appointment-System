import 'package:appointment_app/app_constants.dart';
import 'package:appointment_app/pages/appointments_page.dart';
import 'package:appointment_app/pages/notifications.dart';
import 'package:appointment_app/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:appointment_app/pages/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  PageController _pageController = PageController();
  late List<Widget> _screens;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _screens = [
      HomePage(),
      NotificationsPage(),
      AppointmentsPage(),
      ProfilePage()
    ];
  }

  void _onPageChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    setState(() {
      _pageController.jumpToPage(selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: customBottomNavBar(context),
        ),
      ),
    );
  }

  GNav customBottomNavBar(BuildContext context) {
    return GNav(
      onTabChange: _onItemTapped,
      tabBackgroundColor: Constants.mainColor,
      gap: 8,
      color: Constants.mainColor,
      activeColor: Colors.white,
      padding: EdgeInsets.all(16),
      tabs: [
        GButton(
          icon: Icons.home,
          text: "Home Page",
        ),
        GButton(
          icon: Icons.notifications,
          text: "Notifications",
        ),
        GButton(
          icon: Icons.calendar_month_outlined,
          text: "Appointments",
        ),
        GButton(
          icon: Icons.account_circle_outlined,
          text: "Profile",
        ),
      ],
    );
  }
}
