import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scholarship/value/branding_color.dart';

showSnackbar({
  @required GlobalKey<ScaffoldState> key,
  @required String message,
  Color color,
}) {
  key.currentState.showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: color ?? brandingColor,
  ));
}
