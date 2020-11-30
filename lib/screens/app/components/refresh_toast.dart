import 'package:flutter/material.dart';

// ignore: unused_element
void _showToastdatacouldnt(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text("Couldn't refresh data"),
        action: SnackBarAction(
            label: 'refresh', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }