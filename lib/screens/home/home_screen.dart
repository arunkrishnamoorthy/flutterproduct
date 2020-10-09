import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:shop_app/screens/create/create_screen.dart';
import 'package:shop_app/screens/createconf/createconf_screen.dart';
import 'components/body.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:shop_app/components/custom_drawer.dart';
import 'package:toast/toast.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
// class HomeScreen extends StatelessWidget {
  FSBStatus drawerStatus;

  Future<void> showSortOptions(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Sort By...'),
            content: SingleChildScrollView(
              child: ListBody(children: <Widget>[
                GestureDetector(
                    child: Text("Favorite"),
                    onTap: () {
                      debugPrint("Sort by Favorite");
                      Navigator.of(context).pop();
                      Toast.show("Sort By Favorite Executed", context,
                          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                    }),
                Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                    child: Text("Product Type"),
                    onTap: () {
                      debugPrint("Sort by Product Type");
                      Navigator.of(context).pop();
                      Toast.show("Sort By Product Type Executed", context,
                          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                    }),
                Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                    child: Text("Availability"),
                    onTap: () {
                      debugPrint("Sort by Availability");
                      Navigator.of(context).pop();
                      Toast.show("Sort By Availability Executed", context,
                          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                    }),
              ]),
            ),
          );
        });
  }

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
          index: 1,
          items: <Widget>[
            Icon(Icons.compare_arrows, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.add, size: 30),
          ],
          onTap: (index) {
            //Handle button tap
            // debugPrint("Current Index is $index");
            debugPrint("Current Index is $index");
            if (index == 2) {
              Navigator.pushNamed(context, CreateConfirm.routeName);
            }
            if (index == 0) {
              showSortOptions(context);
            }
          },
        ),
        drawer: CustomDrawer());
  }
}
