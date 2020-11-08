import 'package:flutter/material.dart';
import 'package:scholarship/presentation/Opportunities/opportunities_page.dart';
import 'package:scholarship/presentation/auth/account_page.dart';
import 'package:scholarship/presentation/favourites/favorities_page.dart';
import 'package:scholarship/presentation/forum/questions_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();

  final List<Widget> _screens = [
    OpportunitiesPage(),
    QuestionsPage(),
    FavoritiesPage(),
    AccountPage()
  ];

  int _selectedIndex = 0;

  void _onPageChanged(int pageIndex) {
    setState(() {
      _selectedIndex = pageIndex;
    });
  }

  void _onItemTapped(int itemIndex) {
    _pageController.jumpToPage(itemIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: _screens,
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            title: Text(
              "Opportunities",
              style: TextStyle(
                  color: _selectedIndex == 0
                      ? Theme.of(context).primaryColor
                      : Colors.grey),
            ),
            icon: Icon(
              Icons.home,
              color: _selectedIndex == 0
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            title: Text(
              "Forum",
              style: TextStyle(
                  color: _selectedIndex == 1
                      ? Theme.of(context).primaryColor
                      : Colors.grey),
            ),
            icon: Icon(
              Icons.chat,
              color: _selectedIndex == 1
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            title: Text(
              "Faorities",
              style: TextStyle(
                  color: _selectedIndex == 2
                      ? Theme.of(context).primaryColor
                      : Colors.grey),
            ),
            icon: Icon(
              Icons.favorite,
              color: _selectedIndex == 2
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            title: Text(
              "Account",
              style: TextStyle(
                  color: _selectedIndex == 3
                      ? Theme.of(context).primaryColor
                      : Colors.grey),
            ),
            icon: Icon(
              Icons.person,
              color: _selectedIndex == 3
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
