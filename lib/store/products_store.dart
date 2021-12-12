import 'package:demo_goods_manage_flutter_app/model/product.model.dart';
import 'package:demo_goods_manage_flutter_app/store/repository/products_list.repo.dart';
import 'package:mobx/mobx.dart';

part 'products_store.g.dart';

class ProductsStore extends _ProductsStore with _$ProductsStore {
  ProductsStore() : super(ProductsListRepo());
}

abstract class _ProductsStore with Store {
  final ProductsListRepo _listRepo;
  _ProductsStore(this._listRepo);

  @observable
  var products = ObservableList<ProductModel>();

  @observable
  bool status = false;

  @action
  Future<void> getProducts() async {
    status = true;
    var pros = await _listRepo.getProducts();
    status = false;

    products.addAll(pros);
  }
}
