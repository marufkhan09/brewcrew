import 'package:flutter/material.dart';

var textInputDecoration = InputDecoration(
    hintText: "email",
    fillColor: Colors.white,
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        color: Colors.grey.shade200,
        width: 2,
      ),
    ),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
      color: Colors.black26,
      width: 2,
    )));
