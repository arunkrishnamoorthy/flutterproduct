import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/createProduct.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../../../size_config.dart';
import 'package:geolocator/geolocator.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/screens/home/components/icon_btn_with_counter.dart';
import 'package:shop_app/screens/home/components/section_title_only.dart';
import 'package:speech_recognition/speech_recognition.dart';
import 'package:permission_handler/permission_handler.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _product = CreateProduct();
  final _formKey = GlobalKey<FormState>();
  String result = '';
  File imageFile;
  File imageFileOcr;
  Position userLocation;
  String _currentAddress;
  final picker = ImagePicker();
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  final myController = TextEditingController();
  final myProductNumber = TextEditingController();
  final myProductDesc = TextEditingController();
  final myProductGroup = TextEditingController();
  final myProductPrice = TextEditingController();
  String fieldName = "";
  FocusNode _focus1 = new FocusNode();
  FocusNode _focus2 = new FocusNode();
  FocusNode _focus3 = new FocusNode();
  FocusNode _focus4 = new FocusNode();
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
    myController.dispose();
    myProductNumber.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    this._getCurrentLocation();
    askForPermissions();
    _focus1.addListener(_onFocusChange1);
    _focus2.addListener(_onFocusChange2);
    _focus3.addListener(_onFocusChange3);
    _focus4.addListener(_onFocusChange4);
    myController.addListener(_printLatestValue);
    myProductNumber.addListener(_productNumber);
  }

  void _onFocusChange1() {
    setState(() => fieldName = "A");
    debugPrint("fieldName A $fieldName");
    debugPrint("Focus: " + _focus1.hasFocus.toString());
  }

  void _onFocusChange2() {
    setState(() => fieldName = "B");
    debugPrint("fieldName B $fieldName");
    debugPrint("Focus: " + _focus2.hasFocus.toString());
  }

  void _onFocusChange3() {
    setState(() => fieldName = "C");
    debugPrint("fieldName C $fieldName");
    debugPrint("Focus: " + _focus3.hasFocus.toString());
  }

  void _onFocusChange4() {
    setState(() => fieldName = "D");
    debugPrint("fieldName D $fieldName");
    debugPrint("Focus: " + _focus4.hasFocus.toString());
  }

  Future askForPermissions() async {
    if (await Permission.microphone.request().isGranted) {
      print('Permission granted');
      initSpeechRecognizer();
      // Either the permission was already granted before or the user just granted it.
    }
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
        (String speech) => {setState(() => resultText = speech)});

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

  _printLatestValue() {
    // print("Print Latest Value");
    // // myController.text = "Default Value";
    // myController.value = TextEditingValue(text: _currentAddress);
  }

  _getCurrentLocation() {
    debugPrint("Get Current Location Triggered");
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      debugPrint("Position $position");
      setState(() {
        userLocation = position;
      });
      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      debugPrint("Get Address from Lattitude and longitude");
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          userLocation.latitude, userLocation.longitude);

      Placemark place = p[0];
      debugPrint("Placemark $place");
      setState(() {
        _currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
        debugPrint("Current Address $_currentAddress");
      });
      myController.value = TextEditingValue(text: _currentAddress);
    } catch (e) {
      print(e);
    }
  }

  Future _openGallery(BuildContext context) async {
    // final pickedFile = await picker.getImage(source: ImageSource.gallery);
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = image; //File(pickedFile.path);
    });
    Navigator.of(context).pop();
  }

  Future _openGalleryOCR(BuildContext context) async {
    // final pickedFile = await picker.getImage(source: ImageSource.gallery);
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFileOcr = image; //File(pickedFile.path);
    });
    FirebaseVisionImage ourImage = FirebaseVisionImage.fromFile(image);
    TextRecognizer recognizeText = FirebaseVision.instance.textRecognizer();
    VisionText readText = await recognizeText.processImage(ourImage);

    for (TextBlock block in readText.blocks) {
      for (TextLine line in block.lines) {
        for (TextElement word in line.elements) {
          print(word.text);
        }
      }
    }
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    // final pickedFile = await picker.getImage(source: ImageSource.camera);
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      imageFile = image;
      //File(pickedFile.path);
    });
    Navigator.of(context).pop();
  }

  _openCameraOCR(BuildContext context) async {
    // final pickedFile = await picker.getImage(source: ImageSource.camera);
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      imageFileOcr = image;
      //File(pickedFile.path);
    });
    FirebaseVisionImage ourImage = FirebaseVisionImage.fromFile(image);
    TextRecognizer recognizeText = FirebaseVision.instance.textRecognizer();
    VisionText readText = await recognizeText.processImage(ourImage);

    for (TextBlock block in readText.blocks) {
      for (TextLine line in block.lines) {
        for (TextElement word in line.elements) {
          print(word.text);
          if (fieldName == "A") {
            myProductNumber.value = TextEditingValue(text: word.text);
          } else if (fieldName == "B") {
            myProductDesc.value = TextEditingValue(text: word.text);
          } else if (fieldName == "C") {
            myProductGroup.value = TextEditingValue(text: word.text);
          } else if (fieldName == "D") {
            myProductPrice.value = TextEditingValue(text: word.text);
          }
        }
      }
    }
    Navigator.of(context).pop();
  }

  Future<void> _showImageDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Choose Image from..'),
            content: SingleChildScrollView(
              child: ListBody(children: <Widget>[
                GestureDetector(
                    child: Text("Gallery"),
                    onTap: () {
                      _openGallery(context);
                    }),
                Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                    child: Text("Camera"),
                    onTap: () {
                      _openCamera(context);
                    }),
              ]),
            ),
          );
        });
  }

  Future<void> _showImageDialogOCR(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Choose Image from..'),
            content: SingleChildScrollView(
              child: ListBody(children: <Widget>[
                GestureDetector(
                    child: Text("Gallery"),
                    onTap: () {
                      _openGalleryOCR(context);
                    }),
                Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                    child: Text("Camera"),
                    onTap: () {
                      _openCameraOCR(context);
                    }),
              ]),
            ),
          );
        });
  }

  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult;
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

  Widget _decideImageView() {
    if (imageFile == null) {
      return Text("No Image Selected");
    } else {
      return Image.file(imageFile, width: 100, height: 100);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: SingleChildScrollView(
          child: Builder(
              builder: (context) => Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: SizeConfig.screenHeight * 0.02),
                          SectionTitleOnly(title: "Basic Info", press: () {}),
                          SizedBox(height: SizeConfig.screenHeight * 0.02),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                  width: 200,
                                  // height: 10,
                                  child: TextField(
                                    // initialValue: result,
                                    // maxLength: 10,
                                    focusNode: _focus1,
                                    controller: myProductNumber,
                                    // style:
                                    decoration: const InputDecoration(
                                      // disabledBorder: true,
                                      // icon: Icon(Icons.send),
                                      hintText:
                                          'Enter the Product Number / Scan',
                                      labelText: 'Number *',
                                    ),
                                    // validator: (value) {
                                    //   if (value.isEmpty) {
                                    //     return 'Please enter the product number';
                                    //   }
                                    // },
                                  )),
                              IconBtnWithCounter(
                                  svgSrc: "assets/icons/scan.svg",
                                  press: () {
                                    _scanQR();
                                    // => Navigator.pushNamed(context, CartScreen.routeName),
                                  }),
                              IconBtnWithCounter(
                                svgSrc: "assets/icons/text.svg",
                                // numOfitem: 3,
                                press: () {
                                  _showImageDialogOCR(context);
                                },
                              ),
                              _canShowMic
                                  ? IconBtnWithCounter(
                                      svgSrc: "assets/icons/mic.svg",
                                      // numOfitem: 3,
                                      press: () {
                                        print('Active Method');
                                        print('Is Available is $_isAvailable');
                                        debugPrint('Stop Method Triggered');
                                        debugPrint(
                                            'Is Listining is $_isListening');
                                        debugPrint(
                                            'Is Available is $_isAvailable');
                                        if (_isAvailable && !_isListening)
                                          _speechRecognition
                                              .listen(locale: "en_US")
                                              .then((result) =>
                                                  myProductNumber.value =
                                                      TextEditingValue(
                                                          text: result));
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
                                        debugPrint(
                                            'Is Listining is $_isListening');
                                        debugPrint('is result $resultText');

                                        if (fieldName == "A") {
                                          myProductNumber.value =
                                              TextEditingValue(
                                                  text: resultText);
                                        } else if (fieldName == "B") {
                                          myProductDesc.value =
                                              TextEditingValue(
                                                  text: resultText);
                                        } else if (fieldName == "C") {
                                          myProductGroup.value =
                                              TextEditingValue(
                                                  text: resultText);
                                        } else if (fieldName == "D") {
                                          myProductPrice.value =
                                              TextEditingValue(
                                                  text: resultText);
                                        }

                                        // if (_isListening) {
                                        // _speechRecognition.stop().then((result) =>
                                        //     myProductNumber.value = TextEditingValue(text: result));

                                        // _speechRecognition.stop().then((result) => setState(() =>
                                        //     myProductNumber.value =
                                        //         TextEditingValue(text: result)));

                                        setState(() {
                                          _canShowMic = true;
                                        });
                                        setState(() {
                                          _canShowStop = false;
                                        });
                                      },
                                    )
                                  : SizedBox(),
                            ],
                          ),
                          // Text("Barcode Value: $result"),
                          // TextField(
                          //   // initialValue: result,
                          //   controller: myProductNumber,
                          //   decoration: const InputDecoration(
                          //     // icon: Icon(Icons.person),
                          //     border: InputBorder.none,
                          //     hintText: 'Enter the Product Number / Scan',
                          //     labelText: 'Product Number *',
                          //   ),
                          // validator: (value) {
                          //   if (value.isEmpty) {
                          //     return 'Please enter the product number';
                          //   }
                          // },
                          // ),
                          // SizedBox(height: SizeConfig.screenHeight * 0.02),
                          // IconBtnWithCounter(
                          //     svgSrc: "assets/icons/scan.svg",
                          //     press: () {
                          //       _scanQR();
                          //       // => Navigator.pushNamed(context, CartScreen.routeName),
                          //     }),
                          // IconBtnWithCounter(
                          //   svgSrc: "assets/icons/text.svg",
                          //   // numOfitem: 3,
                          //   press: () {
                          //     _showImageDialogOCR(context);
                          //   },
                          // ),
                          // IconBtnWithCounter(
                          //   svgSrc: "assets/icons/mic.svg",
                          //   // numOfitem: 3,
                          //   press: () {
                          //     _showImageDialogOCR(context);
                          //   },
                          // ),
                          // RaisedButton(
                          //   child: new Text(
                          //     "Scan Barcode",
                          //   ),
                          //   onPressed: _scanQR,
                          // ),
                          // RaisedButton(
                          //   child: new Text(
                          //     "Scan Text",
                          //   ),
                          //   onPressed: () {
                          //     _showImageDialogOCR(context);
                          //   },
                          // )
                        ],
                      )),
                      SizedBox(height: SizeConfig.screenHeight * 0.02),
                      TextFormField(
                        focusNode: _focus2,
                        controller: myProductDesc,
                        decoration: const InputDecoration(
                          // icon: Icon(Icons.person),
                          hintText: 'Enter the Product Description',
                          labelText: 'Product Description *',
                          // floatingLabelBehavior: FloatingLabelBehavior.always,
                          // suffixIcon: CustomSurffixIcon(
                          //     svgIcon: "assets/icons/Mail.svg"),
                        ),
                        // validator: (value) {
                        //   if (value.isEmpty) {
                        //     return 'Please enter the product number';
                        //   } else {
                        //     return value;
                        //   }
                        // },
                      ),
                      SizedBox(height: SizeConfig.screenHeight * 0.02),
                      TextFormField(
                        focusNode: _focus3,
                        controller: myProductGroup,
                        decoration: InputDecoration(labelText: 'Product Group'),
                        // validator: (value) {
                        //   if (value.isEmpty) {
                        //     return 'Please enter the product number';
                        //   } else {
                        //     return value;
                        //   }
                        // },
                      ),
                      SizedBox(height: SizeConfig.screenHeight * 0.02),
                      TextFormField(
                        focusNode: _focus4,
                        controller: myProductPrice,
                        decoration: InputDecoration(labelText: 'Price'),
                        // validator: (value) {
                        //   if (value.isEmpty) {
                        //     return 'Please enter the product number';
                        //   } else {
                        //     return value;
                        //   }
                        // },
                      ),
                      // Container(
                      //     padding: EdgeInsets.fromLTRB(0, 50, 0, 20),
                      //     child: Text('Product Type')),
                      SizedBox(height: SizeConfig.screenHeight * 0.02),
                      SectionTitleOnly(title: "Product Type", press: () {}),
                      SwitchListTile(
                          title: const Text('Active Product'),
                          value: _product.activeProduct,
                          onChanged: (bool val) =>
                              setState(() => _product.activeProduct = val)),
                      SizedBox(height: SizeConfig.screenHeight * 0.02),
                      CheckboxListTile(
                          title: const Text('Finished Product'),
                          value: _product.finishedProduct,
                          onChanged: (bool val) =>
                              setState(() => _product.finishedProduct = val)),
                      SizedBox(height: SizeConfig.screenHeight * 0.02),
                      TextFormField(
                        // initialValue: _currentAddress,
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w300),
                        controller: myController,
                        decoration: const InputDecoration(
                            // icon: Icon(Icons.person),
                            // hintText: 'Enter the Location',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            suffixIcon: CustomSurffixIcon(
                                svgIcon: "assets/icons/Mail.svg"),
                            labelText: 'Location *',
                            prefixIcon: Icon(Icons.add_location)),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter the Location';
                          }
                        },
                      ),
                      Text("Detected Location: $_currentAddress"),
                      // Container(
                      //     padding: EdgeInsets.fromLTRB(0, 50, 0, 20),
                      //     child: Text('Add Images')),
                      SizedBox(height: SizeConfig.screenHeight * 0.02),
                      SectionTitleOnly(title: "Add Images", press: () {}),
                      Container(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              _decideImageView(),
                              RaisedButton(
                                color: kPrimaryColor,
                                textColor: Colors.white,
                                onPressed: () {
                                  _showImageDialog(context);
                                },
                                child: Text("Add Image"),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.screenHeight * 0.02),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 16.0),
                        child: RaisedButton(
                            color: kPrimaryColor,
                            textColor: Colors.white,
                            child: new Text(
                              "Create Product",
                            ),
                            onPressed: () {
                              final form = _formKey.currentState;
                              if (form.validate()) {}
                            }),
                      )
                    ],
                  )))),
    );
  }
}
