import 'package:clothing_store_app_ui/camera_page.dart';
import 'package:clothing_store_app_ui/components/constants.dart';
import 'package:clothing_store_app_ui/home.dart';
import 'package:clothing_store_app_ui/models/app.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    CameraPage(),
    Text(
      "third Page",
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
      backgroundColor: App.themeColor,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.0),
              topLeft: Radius.circular(30.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                spreadRadius: 0,
                blurRadius: 10.0,
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.0),
              topLeft: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_filled,
                    size: 30.0,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.camera_enhance,
                    size: 30.0,
                  ),
                  label: "Magic Cam",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_rounded,
                    size: 30.0,
                  ),
                  label: "User",
                ),
              ],
              currentIndex: _selectedIndex,
              unselectedItemColor: ColorPalette.darkColor,
              selectedItemColor: App.mainColor,
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}
