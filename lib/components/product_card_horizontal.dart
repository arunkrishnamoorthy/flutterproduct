import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:toast/toast.dart';

import '../constants.dart';
import '../size_config.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({
    Key key,
    this.width = 140,
    this.aspectRetio = 1.02,
    @required this.product,
  }) : super(key: key);

  final double width, aspectRetio;
  final Product product;

  _showSnackBar(BuildContext context, product) {
    debugPrint("Context of $context");
    debugPrint(product.title);
    showUnsubscribeConfirm(context, product);
  }

  _deleteProduct(product, context) {
    Toast.show("The Selected Product has been Unsubscribed", context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    debugPrint("Product Deleted $product.title");
  }

  Future<void> showUnsubscribeConfirm(BuildContext context, product) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
                'Are you sure you want to Unsubscribe the Product? If yes, select below the reason to unsubscribe the product'),
            content: SingleChildScrollView(
              child: ListBody(children: <Widget>[
                GestureDetector(
                    child: Text("Not Supported Anymore"),
                    onTap: () {
                      Navigator.of(context).pop();
                      _deleteProduct(product, context);
                    }),
                Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                    child: Text("Others"),
                    onTap: () {
                      _deleteProduct(product, context);
                      Navigator.of(context).pop();
                    }),
              ]),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: 'Unsubscribe',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () => _showSnackBar(context, product),
          ),
        ],
        child: Padding(
          padding: EdgeInsets.only(left: getProportionateScreenWidth(10)),
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              DetailsScreen.routeName,
              arguments: ProductDetailsArguments(product: product),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(24.0),
                    child: Image.asset(
                      product.images[0],
                      fit: BoxFit.contain,
                      alignment: Alignment.topRight,
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: TextStyle(color: Colors.black),
                        maxLines: 2,
                      ),
                      Text(
                        "\$${product.price}",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(18),
                          fontWeight: FontWeight.w600,
                          color: kPrimaryColor,
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {},
                        child: Container(
                          padding:
                              EdgeInsets.all(getProportionateScreenWidth(8)),
                          height: getProportionateScreenWidth(28),
                          width: getProportionateScreenWidth(28),
                          decoration: BoxDecoration(
                            color: product.isFavourite
                                ? kPrimaryColor.withOpacity(0.15)
                                : kSecondaryColor.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            "assets/icons/Heart Icon_2.svg",
                            color: product.isFavourite
                                ? Color(0xFFFF4848)
                                : Color(0xFFDBDEE4),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));

    // return Padding(
    //   padding: EdgeInsets.only(left: getProportionateScreenWidth(10)),
    //   child: GestureDetector(
    //     onTap: () => Navigator.pushNamed(
    //       context,
    //       DetailsScreen.routeName,
    //       arguments: ProductDetailsArguments(product: product),
    //     ),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
    //       children: [
    //         Container(
    //           width: 100,
    //           height: 100,
    //           child: ClipRRect(
    //             borderRadius: new BorderRadius.circular(24.0),
    //             child: Image.asset(
    //               product.images[0],
    //               fit: BoxFit.contain,
    //               alignment: Alignment.topRight,
    //             ),
    //           ),
    //         ),
    //         Container(
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 product.title,
    //                 style: TextStyle(color: Colors.black),
    //                 maxLines: 2,
    //               ),
    //               Text(
    //                 "\$${product.price}",
    //                 style: TextStyle(
    //                   fontSize: getProportionateScreenWidth(18),
    //                   fontWeight: FontWeight.w600,
    //                   color: kPrimaryColor,
    //                 ),
    //               ),
    //               InkWell(
    //                 borderRadius: BorderRadius.circular(50),
    //                 onTap: () {},
    //                 child: Container(
    //                   padding: EdgeInsets.all(getProportionateScreenWidth(8)),
    //                   height: getProportionateScreenWidth(28),
    //                   width: getProportionateScreenWidth(28),
    //                   decoration: BoxDecoration(
    //                     color: product.isFavourite
    //                         ? kPrimaryColor.withOpacity(0.15)
    //                         : kSecondaryColor.withOpacity(0.1),
    //                     shape: BoxShape.circle,
    //                   ),
    //                   child: SvgPicture.asset(
    //                     "assets/icons/Heart Icon_2.svg",
    //                     color: product.isFavourite
    //                         ? Color(0xFFFF4848)
    //                         : Color(0xFFDBDEE4),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
