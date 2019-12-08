import 'package:flutter/material.dart';

import 'authentication.dart';
import 'auth_provider.dart';

import 'local_national.dart';
import 'search_page.dart';
import 'search_popular.dart';


class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {

  signOut() async {
    try {
      AuthService auth = Provider.of(context).auth;
      await auth.signOut();
      print("Signed Out!");
    } catch (e) {
      print (e);
    }
  }


  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    LocalNational(),
    SearchPage(),
    Text(
      'Index 2: Add new post',
      style: optionStyle,
    ),
    SearchPopularScreen(),
    Text(
      'Index 2: Profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: Colors.black54,
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          //primaryColor: Colors.white60,
          /*textTheme: Theme
            .of(context)
            .textTheme
            .copyWith(caption: new TextStyle(color: Colors.white70)) // sets the inactive color of the `BottomNavigationBar`,*/
        ),
        child: BottomNavigationBar(
          //backgroundColor: Colors.white10,
          items: const <BottomNavigationBarItem> [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo),
              title: Text('New Post'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              title: Text('Notifications'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              title: Text('Profile'),
            ),
          ],
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.shifting ,
          selectedItemColor: Colors.white70,
          unselectedItemColor: Colors.black87,
          //fixedColor: Colors.black,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}