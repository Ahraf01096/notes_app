
import 'dart:ui';

import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    content: Text(message,style: TextStyle(fontFamily: 'Poppins',fontWeight:FontWeight.w500 ),),
    backgroundColor: color,
  ));
}
