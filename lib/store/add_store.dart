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
  String name = "";

  @observable
  String description = "";

  @observable
  var images = ObservableList<String>();

  @observable
  var variants = ObservableList<Variant>();

  @observable
  bool status = false;

  @action
  Future addImages() async {
    final list = await ImagePicker().pickMultiImage();
    var imgStrLs =
        list?.map((e) => base64Encode(File(e.path).readAsBytesSync())).toList();
    if (imgStrLs != null) images.addAll(imgStrLs);
  }

  @action
  Future deleteImage(int index) async {
    images.removeAt(index);
  }

  @action
  Future addName(String value) async {
    name = value;
  }

  @action
  Future addDesc(String value) async {
    description = value;
  }

  @action
  Future addVariant(Variant value) async {
    variants.add(value);
  }

  @action
  Future deleteVariant(int index) async {
    variants.removeAt(index);
  }

  @action
  Future changeSize(String size, int index) async {
    var vars = ObservableList<Variant>();
    for (var i = 0; i < variants.length; i++) {
      var v = variants[i];
      if (i == index) {
        v.size = size;
      }
      vars.add(v);
    }
    variants = vars;
  }

  @action
  Future changeColor(ProductColor color, int index) async {
    var vars = ObservableList<Variant>();
    for (var i = 0; i < variants.length; i++) {
      var v = variants[i];
      if (i == index) {
        v.color = color;
      }
      vars.add(v);
    }
    variants = vars;
  }

  @action
  Future addPrice(String price, int index) async {
    variants[index].price = price;
    /* var vars = ObservableList<Variant>();
    for (var i = 0; i < variants.length; i++) {
      var v = variants[i];
      if (i == index) {
        v.price = price;
      }
      vars.add(v);
    }
    variants = vars;*/
  }

  /// Add Product to Firebase
  @action
  Future<bool> addProduct() async {
    var product = ProductModel(
        images: images,
        variants: variants,
        name: name,
        description: description);
    final res = await _repo.addAProduct(product);
    return res;
  }
}
