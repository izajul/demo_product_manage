import 'package:demo_goods_manage_flutter_app/store/add_store.dart';
import 'package:demo_goods_manage_flutter_app/store/products_store.dart';
import 'package:demo_goods_manage_flutter_app/view/add_product.view.dart';
import 'package:demo_goods_manage_flutter_app/view/product_list.view.dart';
import 'package:demo_goods_manage_flutter_app/view/splash.view.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

Route onGenerateRoute(settings) {
  Widget _nextPage;

  switch (settings.name) {
    case Splash.routeName:
      _nextPage = const Splash();
      break;
    case AddProduct.routeName:
      _nextPage = Provider<AddProductStore>(
        create: (_) => AddProductStore(),
        child: const AddProduct(),
      );
      break;
    case ProductList.routeName:
      _nextPage = Provider<ProductsStore>(
        create: (_) => ProductsStore(),
        child: const ProductList(),
      );
      break;
    default:
      _nextPage = const Splash();
  }

  return PageRouteBuilder(
      settings: settings,
      pageBuilder: (_, __, ___) => _nextPage,
      transitionsBuilder: (_, anim1, __, child) {
        var begin = const Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.easeInSine;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: anim1.drive(tween),
          child: child,
        );
      });
}
