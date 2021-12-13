import 'package:demo_goods_manage_flutter_app/utility/appearance.dart';
import 'package:demo_goods_manage_flutter_app/view/product_list.view.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  static const routeName = "splash";
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2000)).then((value) =>
        Navigator.pushNamedAndRemoveUntil(
            context, ProductList.routeName, (route) => false));
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text(
          "Demo Product APP",
          style: theme.textTheme.headline4,
        ),
      ),
    );
  }
}
