import 'package:flutter/material.dart';
import 'package:shop_app/screens/comments/comments_screen.dart';

import '../../models/Product.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:toast/toast.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  Future<void> showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("No"),
      onPressed: () {
        Toast.show("Product unsubscription cancelled", context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Yes"),
      onPressed: () {
        Toast.show("Product unsubscribed successfully", context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
        Navigator.of(context).pop();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Unsubscribe"),
      content: Text("Are you sure you want to unsubscribe the Product?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(rating: agrs.product.rating),
      body: Body(product: agrs.product),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blueAccent,
        height: 50,
        animationDuration: Duration(microseconds: 200),
        animationCurve: Curves.bounceInOut,
        index: 1,
        items: <Widget>[
          Icon(Icons.delete, size: 30),
          Icon(Icons.home, size: 30),
          Icon(Icons.comment, size: 30),
        ],
        onTap: (index) {
          //Handle button tap
          debugPrint("Current Index is $index");
          if (index == 0) {
            showAlertDialog(context);
          }
          if (index == 2) {
            Navigator.pushNamed(context, CommentScreen.routeName);
          }
        },
      ),
    );
  }
}

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({@required this.product});
}
