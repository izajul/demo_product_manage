import 'package:demo_goods_manage_flutter_app/utility/appearance.dart';
import 'package:demo_goods_manage_flutter_app/utility/functions.dart';
import 'package:demo_goods_manage_flutter_app/view/product_list.view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  //1
  WidgetsFlutterBinding.ensureInitialized();
//2
  await Firebase.initializeApp();
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
      initialRoute: ProductList.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}
