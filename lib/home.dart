import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tez_mall/pages/page1_utilites/page1.dart';
import 'package:tez_mall/pages/page2/page2.dart';
import 'package:tez_mall/pages/page3/page3.dart';
import 'package:tez_mall/pages/page4/page4.dart';
import 'package:badges/badges.dart';
import 'package:tez_mall/provider/add_to_cart.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  String name;
  String email;
  String tele;
  Home({Key? key, required this.email, required this.name, required this.tele})
      : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static TextStyle optionStyle =
      const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = [
    const Page1(),
    const Page2(),
    const Page3(),
    const Page4(),
  ];

  void _onItemTapped(int index) {
    HapticFeedback.lightImpact();
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<CounterModel>(context);

    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.grey,
              size: 25,
            ),
            label: 'Bosh sahifa',
            backgroundColor: Colors.white,
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.category_rounded,
              color: Colors.grey,
              size: 25,
            ),
            label: 'Katalog',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: counter.cartkList.isEmpty
                ? const Icon(
                    Icons.favorite,
                    size: 25,
                    color: Colors.grey,
                  )
                : Badge(
                    badgeContent: Text(counter.cartkList.length.toString()),
                    child: const Icon(
                      Icons.shopping_cart,
                      size: 25,
                      color: Colors.grey,
                    ),
                  ),
            label: 'Sevimlilar',
            backgroundColor: Colors.white,
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 25,
              color: Colors.grey,
            ),
            label: 'Profil',
            backgroundColor: Colors.white,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}
