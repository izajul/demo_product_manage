import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_goods_manage_flutter_app/model/product.model.dart';
import 'package:demo_goods_manage_flutter_app/store/repository/root.repo.dart';

class ProductsListRepo extends RootRepo {
  CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  Future<List<ProductModel>> getProducts() async {
    var ss = await products.get();
    List l = ss.docs.map((e) => e.data()).toList();
    var m = l.map((e) => ProductModel.fromJson(e)).toList();
    return m;
  }
}
