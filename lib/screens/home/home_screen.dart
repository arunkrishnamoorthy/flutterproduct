import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:shop_app/screens/create/create_screen.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products App'), actions: <Widget>[
        // new IconButton(icon: new Icon(Icons.search), onPressed: () {}),
        new IconButton(icon: new Icon(Icons.more_vert), onPressed: () {})
      ]),
      body: Body(),
      // bottomNavigationBar: BottomAppBar(
      //   shape: const CircularNotchedRectangle(),
      //   child: Container(
      //     height: 50.0,
      //   ),
      // ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blueAccent,
        // child: Container(
        //   height: 50.0,
        // ),
        height: 50,
        animationDuration: Duration(microseconds: 200),
        animationCurve: Curves.bounceInOut,
        items: <Widget>[
          Icon(Icons.list, size: 30),
          // Icon(Icons.list, size: 30),
          // Icon(Icons.compare_arrows, size: 30),
          Icon(Icons.compare_arrows, size: 30),
          // Icon(Icons.verified_user, size: 30),
          Icon(Icons.add, size: 30),
        ],
        onTap: (index) {
          //Handle button tap
          // debugPrint("Current Index is $index");
          if (index == 2) {
            debugPrint("Current Index is $index");
            Navigator.pushNamed(context, CreateScreen.routeName);
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: <Color>[
                  Colors.deepOrange,
                  Colors.orangeAccent
                ])),
                child: Text('This is a Drawer Header')),
            ListTile(
              title: Text('This is Tile1'),
            ),
            ListTile(
              title: Text('This is Tile2'),
            ),
            ListTile(
              title: Text('This is Tile3'),
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   // onPressed: () => {
      //   //   // _count++;
      //   // }),
      //   tooltip: 'Increment Counter',
      //   child: Icon(Icons.add),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
