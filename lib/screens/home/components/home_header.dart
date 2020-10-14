import 'package:flutter/material.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';

import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);
  @override
  _HomeHeaderState createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
// class HomeHeader extends StatelessWidget {
  // const HomeHeader({
  //   Key key,
  // }) : super(key: key);
  final myProductNumber = TextEditingController();
  String result = '';

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myProductNumber.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    myProductNumber.addListener(_productNumber);
  }

  _productNumber() {
    // myProductNumber.value = TextEditingValue(text: _currentAddress);
  }

  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        // result = qrResult;
        myProductNumber.value = TextEditingValue(text: qrResult);
        print("Scan Result $result");
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconBtnWithCounter(
              svgSrc: "assets/icons/scan.svg",
              press: () {
                _scanQR();
                // => Navigator.pushNamed(context, CartScreen.routeName),
              }),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfitem: 3,
            press: () {},
          ),
        ],
      ),
    );
  }
}
