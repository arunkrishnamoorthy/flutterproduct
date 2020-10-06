import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../size_config.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:toast/toast.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

_showSnackBar(BuildContext context) {
  showAlertDialog(context);
  debugPrint("Snackbar");
}

Future<void> showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("No"),
    onPressed: () {
      Toast.show("Question has not been deleted", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = FlatButton(
    child: Text("Yes"),
    onPressed: () {
      Toast.show("The Selected Question has been deleted successfully", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      Navigator.of(context).pop();
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Delete"),
    content: Text("Are you sure you want to Delete this Question?"),
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

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: SingleChildScrollView(
        child: Container(
          // color: Colors.black,
          child: Center(
            child: Column(
              children: <Widget>[
                Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.25,
                  secondaryActions: <Widget>[
                    IconSlideAction(
                      caption: 'Delete',
                      color: Colors.red,
                      icon: Icons.delete,
                      onTap: () => _showSnackBar(context),
                    ),
                  ],
                  child: GFAccordion(
                      title: 'Is this Product Available in Different Colors?',
                      content:
                          'Yes the Product is available in Different Colours',
                      collapsedIcon: Icon(Icons.add),
                      expandedIcon: Icon(Icons.minimize)),
                ),
                Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.red,
                        icon: Icons.delete,
                        onTap: () => _showSnackBar(context),
                      ),
                    ],
                    child: GFAccordion(
                        title:
                            'What are the locations the product is available?',
                        content:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        collapsedIcon: Icon(Icons.add),
                        expandedIcon: Icon(Icons.minimize))),
                Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.red,
                        icon: Icons.delete,
                        onTap: () => _showSnackBar(context),
                      ),
                    ],
                    child: GFAccordion(
                        title: '1914 translation by H. Rackham?',
                        content:
                            'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?',
                        collapsedIcon: Icon(Icons.add),
                        expandedIcon: Icon(Icons.minimize))),
                Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.red,
                        icon: Icons.delete,
                        onTap: () => _showSnackBar(context),
                      ),
                    ],
                    child: GFAccordion(
                        title: 'Is this Product Available in Different Colors?',
                        content:
                            'Yes the Product is available in Different Colours',
                        collapsedIcon: Icon(Icons.add),
                        expandedIcon: Icon(Icons.minimize))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
