import 'package:flutter/material.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:speech_recognition/speech_recognition.dart';

import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import '../../../constants.dart';

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
  SpeechRecognition _speechRecognition;
  bool _isAvailable = false;
  bool _isListening = false;
  bool _canShowMic = true;
  bool _canShowStop = false;

  String resultText = "";

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

  void initSpeechRecognizer() {
    _speechRecognition = SpeechRecognition();

    _speechRecognition.setAvailabilityHandler(
      (bool result) => setState(() => _isAvailable = result),
    );

    _speechRecognition.setRecognitionStartedHandler(
      () => setState(() => _isListening = true),
    );

    _speechRecognition.setRecognitionResultHandler(
      (String speech) => setState(() => resultText = speech),
    );

    _speechRecognition.setRecognitionCompleteHandler(
      () => setState(() => _isListening = false),
    );

    _speechRecognition.activate().then(
          (result) => setState(() => _isAvailable = result),
        );
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
          Container(
            width: SizeConfig.screenWidth * 0.6,
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              controller: myProductNumber,
              onChanged: (value) => print(value),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20),
                      vertical: getProportionateScreenWidth(9)),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: "Search product",
                  prefixIcon: Icon(Icons.search)),
            ),
          ),
          // SearchField(),
          IconBtnWithCounter(
              svgSrc: "assets/icons/scan.svg",
              press: () {
                _scanQR();
                // => Navigator.pushNamed(context, CartScreen.routeName),
              }),
          _canShowMic
              ? IconBtnWithCounter(
                  svgSrc: "assets/icons/mic.svg",
                  // numOfitem: 3,
                  press: () {
)
                    if (_isAvailable && !_isListening)
                      _speechRecognition
                          .listen(locale: "en_US")
                          .then((result) => print('$result'));
                    // _canShowMic = false;
                    // _canShowStop = true;
                    setState(() {
                      _canShowMic = false;
                    });
                    setState(() {
                      _canShowStop = true;
                    });
                  },
                )
              : SizedBox(),
          _canShowStop
              ? IconBtnWithCounter(
                  svgSrc: "assets/icons/stop.svg",
                  // numOfitem: 3,
                  press: () {
                    print('Stop Method Triggered');
                    print('Is Listining is $_isListening');
                                        debugPrint('Stop Method Triggered');
                    debugPrint('Is Listining is $_isListening');
                    if (_isListening) {
                      _speechRecognition.stop().then((result) => print('$result'));
                          //   (result) => { 
                          //     // print('Result is $result');
                          //     // debugPrint('Result is $result');
                          //     setState(() => _isListening = result) },
                          // );
                    }
                    setState(() {
                      _canShowMic = true;
                    });
                    setState(() {
                      _canShowStop = false;
                    });
                  },
                )
              : SizedBox(),
          // FloatingActionButton(
          //   child: Icon(Icons.cancel),
          //   mini: true,
          //   backgroundColor: Colors.deepOrange,
          //   onPressed: () {
          //     if (_isListening)
          //       _speechRecognition.cancel().then(
          //             (result) => setState(() {
          //               _isListening = result;
          //               resultText = "";
          //             }),
          //           );
          //   },
          // ),
          // FloatingActionButton(
          //   child: Icon(Icons.mic),
          //   onPressed: () {
          //     if (_isAvailable && !_isListening)
          //       _speechRecognition
          //           .listen(locale: "en_US")
          //           .then((result) => print('$result'));
          //   },
          //   backgroundColor: Colors.pink,
          // ),
          // FloatingActionButton(
          //   child: Icon(Icons.stop),
          //   mini: true,
          //   backgroundColor: Colors.deepPurple,
          //   onPressed: () {
          //     if (_isListening)
          //       _speechRecognition.stop().then(
          //             (result) => setState(() => _isListening = result),
          //           );
          //   },
          // ),
        ],
      ),
    );
  }
}
