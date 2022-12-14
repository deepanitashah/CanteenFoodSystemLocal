import 'package:canteen_system/helper/constants.dart';
import 'package:canteen_system/helper/size_config.dart';
import 'package:canteen_system/providers/cart_provider.dart';
import 'package:canteen_system/screens/cartScreen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:badges/badges.dart';
import 'package:provider/src/consumer.dart';

AppBar customAppBar(String title) {
  return AppBar(
    leading: Padding(
      padding: const EdgeInsets.only(left: 8),
      child: IconButton(
        icon: Icon(Icons.favorite_border,
            color: kTextColor, size: getProportionateScreenWidth(30)),
        onPressed: () {},
      ),
    ),
    title: Center(
      child: Text(
        title,
        style: kAppBarTextStyle,
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(left: 8),
        child: IconButton(
          icon: Icon(Icons.notifications_outlined,
              color: kTextColor, size: getProportionateScreenWidth(30)),
          onPressed: () {},
        ),
      ),
      Consumer<CartProvider>(builder: (context, cartProvider, _) {
        return Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            icon: Badge(
                badgeContent: Text(
                  cartProvider.items.length.toString(),
                  style: const TextStyle(color: Colors.black),
                ),
                animationDuration: Duration(milliseconds: 300),
                badgeColor: Colors.white,
                position: BadgePosition.topEnd(),
                child: Icon(Icons.shopping_cart_outlined,
                    color: kTextColor, size: getProportionateScreenWidth(30))),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
          ),
        );
      }),
    ],
  );
}
