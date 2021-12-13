import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo_goods_manage_flutter_app/model/product.model.dart';
import 'package:demo_goods_manage_flutter_app/store/show_store.dart';
import 'package:demo_goods_manage_flutter_app/store/store.dart';
import 'package:demo_goods_manage_flutter_app/utility/appearance.dart';
import 'package:demo_goods_manage_flutter_app/view/widgets/buttons.widget.dart';
import 'package:demo_goods_manage_flutter_app/view/widgets/product_variant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  static const routeName = "product_details.route";
  const ProductDetails({Key? key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late ShowStore _store;
  @override
  void didChangeDependencies() {
    _store = Provider.of<Store>(context).showStore;
    super.didChangeDependencies();
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
                        "Products Details",
                        style: textTheme.headline6,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Product Images ",
                style: textTheme.subtitle1,
              ),
              const SizedBox(
                height: 5,
              ),
              Observer(
                builder: (_) {
                  return CarouselSlider(
                    options: CarouselOptions(
                        height: 200.0,
                        enableInfiniteScroll: false,
                        enlargeCenterPage: true),
                    items: _store.product.images.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6)),
                              child: Image.memory(base64Decode(i)));
                        },
                      );
                    }).toList(),
                  );
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Observer(
                  builder: (_) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _store.product.name.isEmpty
                                    ? "Product Name"
                                    : _store.product.name,
                                style: textTheme.button,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                _store.product.description.isEmpty
                                    ? "Product Description"
                                    : _store.product.description,
                                style: textTheme.bodyText2,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Price ",
                                style: textTheme.button,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                _store.price.isEmpty
                                    ? "0.00\$"
                                    : "${_store.price}\$",
                                style: textTheme.button,
                              ),
                            ],
                          ),
                        ],
                      )),
              const SizedBox(
                height: 15,
              ),
              Observer(
                  builder: (_) => Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sizes",
                                  style: textTheme.subtitle1,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: List.generate(
                                    sizes.length,
                                    (index) {
                                      return customSizeButton(
                                          sizes[index],
                                          _store.size,
                                          (size) => _store.changeSize(size));
                                    },
                                  ).toList(),
                                )
                              ],
                            )),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Colors",
                                  style: textTheme.subtitle1,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: List.generate(
                                    colors.length,
                                    (index) {
                                      return customRadioButton(
                                          colors[index],
                                          _store.color,
                                          (color) => _store.changeColor(color));
                                    },
                                  ).toList(),
                                )
                              ],
                            )),
                          ])),
            ],
          ),
        ),
      ),
    );
  }

  Widget customSizeButton(String text, String active, action) {
    return ButtonOutLine(
      widht: 50,
      margin: const EdgeInsets.only(right: 5),
      borderRadious: 6.0,
      borderColor: (active == text) ? Colors.green : Colors.black,
      padding: 5.0,
      onPress: () => action(text),
      text: Text(
        text,
        style: TextStyle(
          color: (active == text) ? Colors.green : Colors.black,
        ),
      ),
    );
  }

  Widget customRadioButton(ProductColor color, String active, action) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: SizedBox(
        width: 33,
        height: 33,
        child: OutlinedButton(
          onPressed: () => action(color.name),
          style: OutlinedButton.styleFrom(
              primary: Colors.blue,
              padding: const EdgeInsets.all(0),
              backgroundColor: Color(color.code),
              side: BorderSide(
                width: 1.5,
                color:
                    (color.name == active) ? Colors.green : MyColors.borderDark,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0))),
          child: (color.name == active)
              ? const Icon(
                  Icons.check,
                  size: 33,
                  color: Colors.green,
                )
              : Container(),
          // child: text ?? const Text("button"),
        ),
      ),
    );
  }
}
