import 'package:flutter/material.dart';

AppBar descoverAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: RichText(
      text: TextSpan(
        style: Theme.of(context)
            .textTheme
            // ignore: deprecated_member_use
            .title
            .copyWith(fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: "Descover",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    ),
  );
}
