import 'package:dating_social_app/modules/account/views/account_page.dart';
import 'package:dating_social_app/modules/authenticate/views/register_page.dart';
import 'package:dating_social_app/modules/homepage/views/home_page.dart';
import 'package:dating_social_app/modules/notify/views/notify_page.dart';
import 'package:dating_social_app/modules/search/views/search_page.dart';
import 'package:flutter/material.dart';

class MainApp extends StatefulWidget {
  @override
  _MainApp createState() => _MainApp();
}

class _MainApp extends State<MainApp> {
  int _selectedIndex = 0;
  List<Widget> pageList = <Widget>[
    HomePage(),
    SearchPage(),
    NotifyPage(),
    AccountPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[_selectedIndex],
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (value) {
        setState(() {
          _selectedIndex = value;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: "Noitfy",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.reorder),
          label: "Account",
        ),
      ],
      selectedItemColor: const Color.fromRGBO(121, 27, 247, 1),
    );
  }
}
