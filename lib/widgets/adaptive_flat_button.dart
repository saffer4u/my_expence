import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AdaptiveFlatButton extends StatelessWidget {
  final String text;
  final Function handler;

  AdaptiveFlatButton(this.text,this.handler);
  @override
  Widget build(BuildContext context) {
    return  //Cupertino button for IOS devices.
            //If we know text will never change we could write const in front of that widget, in order to improve performance.
                    Platform.isIOS
                        ? CupertinoButton(
                            child: const Text(
                              'Choose Date',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            onPressed: handler,
                            
                          )
                        : FlatButton(
                            textColor: Theme.of(context).primaryColor,
                            child: const Text(
                              'Choose Date',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            onPressed: handler,
                          );
  }
}