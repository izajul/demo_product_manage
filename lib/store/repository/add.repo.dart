import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_goods_manage_flutter_app/model/product.model.dart';
import 'package:demo_goods_manage_flutter_app/store/repository/root.repo.dart';

class AddProductRepo extends RootRepo {
  Future<bool> addAProduct(ProductModel product) async {
    DocumentReference d = await collection.add(product.toJson());
    return d.id.isNotEmpty;
  }
}
