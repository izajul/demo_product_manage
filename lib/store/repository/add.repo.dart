import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_goods_manage_flutter_app/model/product.model.dart';

class AddProductRepo {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('products');

  Future<bool> addAProduct(ProductModel product) async {
    DocumentReference d = await collection.add(product.toJson());
    return d.id.isNotEmpty;
  }
}
