import 'package:flutter/material.dart';

import '../../models/Product.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(rating: agrs.product.rating),
      body: Body(product: agrs.product),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: agrs.product.colors[0],
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
          debugPrint("Current Index is $index");
        },
      ),
    );
  }
}

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({@required this.product});
}
