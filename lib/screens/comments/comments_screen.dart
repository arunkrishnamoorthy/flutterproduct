import 'package:flutter/material.dart';
import 'package:shop_app/models/Cart.dart';

import 'components/body.dart';

class CommentScreen extends StatelessWidget {
  static String routeName = "/comment";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      floatingActionButton: FloatingActionButton(
        // onPressed: _incrementCounter,
        tooltip: 'Chat',
        child: Icon(Icons.chat_bubble),
      ),
      // bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "FAQ's",
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}
