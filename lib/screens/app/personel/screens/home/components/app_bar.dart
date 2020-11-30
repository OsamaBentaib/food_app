import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/components/icons.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/app/personel/screens/orders/order_screen.dart';
import 'package:food_app/screens/app/personel/screens/settings/settings_screen.dart';

AppBar homeAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Container(
      child: Container(
        width: 50,
        height: 26,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/DotEatsLogo.png"),
          ),
        ),
      ),
    ),
    actions: <Widget>[
      IconButton(
        icon: SvgPicture.string(
          '<svg viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M13 14s1 0 1-1-1-4-6-4-6 3-6 4 1 1 1 1h10zm-9.995-.944v-.002.002zM3.022 13h9.956a.274.274 0 0 0 .014-.002l.008-.002c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664a1.05 1.05 0 0 0 .022.004zm9.974.056v-.002.002zM8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/></svg>',
          width: 24,
          height: 24,
          color: kTextColor,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return SettingsScreen();
              },
            ),
          );
        },
      ),
      SizedBox(
        width: 5,
      ),
      IconButton(
        icon: SvgPicture.string(
          '<svg viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M8 1a2 2 0 0 0-2 2v4.5a.5.5 0 0 1-1 0V3a3 3 0 0 1 6 0v4.5a.5.5 0 0 1-1 0V3a2 2 0 0 0-2-2z"/><path fill-rule="evenodd" d="M3.405 6a.5.5 0 0 0-.498.45l-.912 6.9A1.5 1.5 0 0 0 3.488 15h9.024a1.5 1.5 0 0 0 1.493-1.65l-.913-6.9a.5.5 0 0 0-.497-.45h-9.19zm-1.493.35A1.5 1.5 0 0 1 3.405 5h9.19a1.5 1.5 0 0 1 1.493 1.35L15 13.252A2.5 2.5 0 0 1 12.512 16H3.488A2.5 2.5 0 0 1 1 13.251l.912-6.9z"/></svg>',
          width: 22,
          height: 22,
          color: kTextColor,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return OrdersScreen();
              },
            ),
          );
        },
      ),
    ],
  );
}
