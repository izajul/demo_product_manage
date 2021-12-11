import 'package:demo_goods_manage_flutter_app/utility/appearance.dart';
import 'package:demo_goods_manage_flutter_app/utility/functions.dart';
import 'package:demo_goods_manage_flutter_app/view/add_product.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));
    return MaterialApp(
      title: 'Demo Goods Manage APP',
      theme: theme,
      onGenerateRoute: onGenerateRoute,
      initialRoute: AddProduct.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}
