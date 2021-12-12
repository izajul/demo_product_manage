import 'package:demo_goods_manage_flutter_app/store/products_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ProductList extends StatefulWidget {
  static const routeName = "product_list.route";
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late ProductsStore _store;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _store = Provider.of<ProductsStore>(context);
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: ListView(
            shrinkWrap: true,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "Products List ${_store.products.length}",
                    style: textTheme.headline6,
                  ),
                ),
              ),
              Observer(builder: (_)=>Text("Observed : ${_store.products.length}"))
            ],
          ),
        ),
      ),
    );
  }

  void getProducts() {
    _store.getProducts();
  }
}
