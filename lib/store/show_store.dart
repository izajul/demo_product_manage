import 'package:demo_goods_manage_flutter_app/model/product.model.dart';
import 'package:mobx/mobx.dart';

part 'show_store.g.dart';

class ShowStore extends _ShowStore with _$ShowStore {}

abstract class _ShowStore with Store {
  @observable
  ProductModel? _product;

  @observable
  String _size = "";
  @observable
  String _color = "";
  @observable
  String _price = '';

  @computed
  String get size => _size;

  @computed
  String get color => _color;

  @computed
  String get price => _price;

  @computed
  ProductModel get product =>
      _product ?? ProductModel(images: [], variants: []);

  @action
  Future addProduct(ProductModel product) async {
    _product = product;
    _size = product.variants[0].size;
    _color = product.variants[0].color.name;
    _price = product.variants[0].price;
  }

  @action
  Future changeSize(String v) async {
    _size = v;
    _setPrice();
  }

  @action
  Future changeColor(String v) async {
    _color = v;
    _setPrice();
  }

  Future _setPrice() async {
    Variant? variant;
    for (var v in product.variants) {
      if (v.color.name == _color && v.size == _size) {
        variant = v;
      }
    }

    if (variant != null) {
      _price = variant.price;
    }
  }

  @action
  Future changePrice(String v) async {
    _price = v;
  }
}
