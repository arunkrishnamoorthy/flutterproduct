import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:shop_app/screens/create/create_screen.dart';
import 'components/body.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:shop_app/components/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
// class HomeScreen extends StatelessWidget {
  FSBStatus drawerStatus;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Products App'), actions: <Widget>[
          // new IconButton(icon: new Icon(Icons.search), onPressed: () {}),
          new IconButton(icon: new Icon(Icons.more_vert), onPressed: () {})
        ]),
        body: Body(),
        // body: FoldableSidebarBuilder(
        //   drawerBackgroundColor: Colors.deepOrange,
        //   drawer: CustomDrawer(
        //     closeDrawer: () {
        //       setState(() {
        //         drawerStatus = FSBStatus.FSB_CLOSE; // For Closing the Sidebar
        //       });
        //     },
        //   ),
        //   screenContents: Body(), // Your Screen Widget
        //   status: drawerStatus,
        // ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.blueAccent,
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
        drawer: CustomDrawer());
  }
}
