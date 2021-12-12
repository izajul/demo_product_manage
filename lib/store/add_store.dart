import 'dart:convert';
import 'dart:io';

import 'package:demo_goods_manage_flutter_app/model/product.model.dart';
import 'package:demo_goods_manage_flutter_app/store/repository/add.repo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'add_store.g.dart';

class AddProductStore extends _AddProductStore with _$AddProductStore {
  AddProductStore() : super(AddProductRepo());
}

abstract class _AddProductStore with Store {
  final AddProductRepo _repo;

  _AddProductStore(this._repo);

  @observable
  ProductModel product =
      ProductModel(variants: [], images: []); // assigning empty array

  @observable
  bool status = false;

  @action
  Future addImages(List<XFile> list) async {
    var imgStrLs =
        list.map((e) => base64Encode(File(e.path).readAsBytesSync())).toList();
    product.images.addAll(imgStrLs);
  }

  @action
  Future deleteImage(int index) async {
    product.images.removeAt(index);
  }

  @action
  Future addName(String value) async {
    product.name = value;
  }

  @action
  Future addDesc(String value) async {
    product.description = value;
  }

  @action
  Future addVariant(Variant value) async {
    product.variants.add(value);
  }

  @action
  Future deleteVariant(int index) async {
    product.variants.removeAt(index);
  }

  @action
  Future changeSize(String value, int index) async {
    product.variants[index].size = value;
  }

  @action
  Future changeColor(ProductColor value, int index) async {
    product.variants[index].color = value;
  }

  /// Add Product to Firebase
  @action
  Future<void> addProduct() async {
    status = await _repo.addAProduct(product);
  }
}
