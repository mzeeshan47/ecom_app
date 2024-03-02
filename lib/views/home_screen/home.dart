import 'package:ecom_app/consts/colors.dart';
import 'package:ecom_app/consts/strings.dart';
import 'package:ecom_app/views/cart_screen/cart_screen.dart';
import 'package:ecom_app/views/category_screen/category_screen.dart';
import 'package:ecom_app/views/home_screen/home_screen.dart';
import 'package:ecom_app/views/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  List<Widget> navBody = [
    const HomeScreen(),
    const CategoryScreen(),
    CartScreen(),
    const ProfileScreen(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    var navbarItem = [
      BottomNavigationBarItem(
          icon: Image.asset('assets/icons/home_icon.png', width: 26),
          label: home),
      BottomNavigationBarItem(
          icon: Image.asset('assets/icons/category_icon.png', width: 26),
          label: categories),
      BottomNavigationBarItem(
          icon: Image.asset('assets/icons/cart_icon.png', width: 26),
          label: cart),
      BottomNavigationBarItem(
          icon: Image.asset('assets/icons/account_icon.png', width: 26),
          label: account),
    ];

    return Scaffold(
      body: Center(child: navBody.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: AppColor.color1,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: navbarItem,
        onTap: _onItemTap,
      ),
    );
  }
}
