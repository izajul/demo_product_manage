import 'package:demo_goods_manage_flutter_app/store/products_store.dart';
import 'package:demo_goods_manage_flutter_app/store/show_store.dart';

import 'add_store.dart';

class Store {
  final AddProductStore addProductStore = AddProductStore();
  final ProductsStore productsStore = ProductsStore();
  final ShowStore showStore = ShowStore();
}
