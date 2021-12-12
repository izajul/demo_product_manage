import 'dart:convert';

import 'package:demo_goods_manage_flutter_app/store/products_store.dart';
import 'package:demo_goods_manage_flutter_app/utility/appearance.dart';
import 'package:demo_goods_manage_flutter_app/view/add_product.view.dart';
import 'package:demo_goods_manage_flutter_app/view/widgets/buttons.widget.dart';
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
            scrollDirection: Axis.vertical,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Products List",
                        style: textTheme.headline6,
                      ),
                      Flexible(
                          child: ButtonOutLine(
                        widht: 130,
                        onPress: () =>Navigator.pushNamed(context, AddProduct.routeName),
                        text: Text(
                          " Add Product",
                          style: textTheme.subtitle1,
                        ),
                      ))
                    ],
                  ),
                ),
              ),
              Text(
                "Popular Products ",
                style: textTheme.button,
              ),
              const SizedBox(
                height: 5,
              ),
              Observer(
                  builder: (_) => _store.status
                      ? const Align(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(
                            color: MyColors.primaryAccent,
                          ),
                        )
                      : SizedBox(
                          height: 300,
                          child: ListView(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            scrollDirection: Axis.horizontal,
                            children:
                                List.generate(_store.products.length, (index) {
                              final product = _store.products[index];
                              return GestureDetector(
                                onTap: () {},
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  width: 200,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          elevation: 5,
                                          shadowColor: MyColors.shadow,
                                          child: product.images.isEmpty
                                              ? Image.asset(
                                                  "imgs/default.jpg",
                                                  width: 200,
                                                  height: 200,
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.memory(
                                                  base64Decode(
                                                      product.images[0]),
                                                  width: 200,
                                                  height: 200,
                                                  fit: BoxFit.cover,
                                                ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          product.name,
                                          style: textTheme.bodyText1,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          product.description,
                                          style: textTheme.caption,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ))
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
