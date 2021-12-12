import 'package:demo_goods_manage_flutter_app/model/product.model.dart';
import 'package:demo_goods_manage_flutter_app/store/add_store.dart';
import 'package:demo_goods_manage_flutter_app/utility/appearance.dart';
import 'package:demo_goods_manage_flutter_app/view/widgets/buttons.widget.dart';
import 'package:demo_goods_manage_flutter_app/view/widgets/input_field.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ProductVariant extends StatelessWidget {
  const ProductVariant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AddProductStore>(context);
    return Observer(
        builder: (_) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 5),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Product Variants",
                    style: textTheme.subtitle1,
                  ),
                ),
                ...List.generate(store.variants.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(child: SizeCheckBox(index)),
                        Flexible(child: ColorCheckBox(index)),
                        Flexible(
                            child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Price",
                              style: textTheme.subtitle1,
                            ),
                            FormFieldRounded(
                              initValue: store.variants[index].price,
                              onChange: (value) {
                                store.addPrice(value, index);
                              },
                              inputType: TextInputType.number,
                              hintText: "Price",
                              widht: 80,
                            )
                          ],
                        )),
                        IconButton(
                          onPressed: () {
                            store.deleteVariant(index);
                          },
                          icon: Icon(
                            Icons.cancel,
                            color: Colors.red[300],
                            size: 27,
                          ),
                        )
                      ],
                    ),
                  );
                }).toList(),
                OutlinedButton(
                  style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                    side:
                        const BorderSide(color: MyColors.borderDark, width: 1),
                    maximumSize: const Size(150, 40),
                    shadowColor: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                  ),
                  onPressed: () {
                    store.addVariant(Variant(_sizes[0], _colors[0]));
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.add_circle_outline,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Add Variant")
                    ],
                  ),
                )
              ],
            ));
  }
}

class SizeCheckBox extends StatelessWidget {
  final int rootInx;

  const SizeCheckBox(this.rootInx, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AddProductStore>(context);
    return Observer(builder: (_) {
      final variant = store.variants;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Size",
            style: textTheme.subtitle1,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              _sizes.length,
              (index) {
                return customRadioButton(_sizes[index], variant[rootInx].size,
                    (size) {
                  store.changeSize(size, rootInx);
                });
              },
            ).toList(),
          )
        ],
      );
    });
  }

  Widget customRadioButton(String text, String active, action) {
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
}

class ColorCheckBox extends StatelessWidget {
  final int rootInx;

  const ColorCheckBox(
    this.rootInx, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AddProductStore>(context);
    return Observer(builder: (_) {
      final variant = store.variants[rootInx];

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Color",
            style: textTheme.subtitle1,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              _colors.length,
              (index) {
                return customRadioButton(_colors[index], variant.color,
                    (color) {
                  store.changeColor(color, rootInx);
                });
              },
            ).toList(),
          )
        ],
      );
    });
  }

  Widget customRadioButton(ProductColor color, ProductColor active, action) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: SizedBox(
        width: 33,
        height: 33,
        child: OutlinedButton(
          onPressed: () => action(color),
          style: OutlinedButton.styleFrom(
              primary: Colors.blue,
              padding: const EdgeInsets.all(0),
              backgroundColor: Color(color.code),
              side: BorderSide(
                width: 1.5,
                color: (color == active) ? Colors.green : MyColors.borderDark,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0))),
          child: (color == active)
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

final _sizes = ["small", "large"];
final _colors = [
  ProductColor("white", 0xffffffff),
  ProductColor("black", 0xff000000)
];
