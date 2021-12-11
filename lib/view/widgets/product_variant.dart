import 'package:demo_goods_manage_flutter_app/utility/appearance.dart';
import 'package:demo_goods_manage_flutter_app/view/widgets/buttons.widget.dart';
import 'package:demo_goods_manage_flutter_app/view/widgets/input_field.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProductVariant extends StatefulWidget {
  const ProductVariant({Key? key}) : super(key: key);

  @override
  _ProductVariantState createState() => _ProductVariantState();
}

class _ProductVariantState extends State<ProductVariant> {
  List<Variant> _list = [];

  @override
  void initState() {
    _list.add(Variant(_sizes[0], _colors[0]));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
        ...List.generate(_list.length, (index) {
          final data = _list[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(child: SizeCheckBox(_sizes)),
                Flexible(child: ColorCheckBox(_colors)),
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
                      hintText: "Price",
                      widht: 80,
                    )
                  ],
                )),
                IconButton(
                  onPressed: () {
                    deleteVariant(index);
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
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
            side: const BorderSide(color: MyColors.borderDark, width: 1),
            maximumSize: const Size(150, 40),
            shadowColor: Colors.blueGrey,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          ),
          onPressed: () {
            addVariant();
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
    );
  }

  void addVariant() {
    setState(() {
      _list.add(Variant(_sizes[0], _colors[0]));
    });
  }

  void deleteVariant(int index) {
    setState(() {
      _list.removeAt(index);
    });
  }
}

class SizeCheckBox extends StatefulWidget {
  final List<String> _sizeList;

  const SizeCheckBox(this._sizeList, {Key? key}) : super(key: key);

  @override
  State createState() => _SizeCheckBoxState();
}

class _SizeCheckBoxState extends State<SizeCheckBox> {
  int _active = 0;
  @override
  Widget build(BuildContext context) {
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
            widget._sizeList.length,
            (index) {
              final data = widget._sizeList[index];
              return customRadioButton(data, index);
            },
          ).toList(),
        )
      ],
    );
  }

  Widget customRadioButton(String text, int index) {
    return ButtonOutLine(
      widht: 50,
      margin: EdgeInsets.only(right: 5),
      borderRadious: 6.0,
      borderColor: (_active == index) ? Colors.green : Colors.black,
      padding: 5.0,
      onPress: () {
        setState(() {
          _active = index;
        });
      },
      text: Text(
        text,
        style: TextStyle(
          color: (_active == index) ? Colors.green : Colors.black,
        ),
      ),
    );
  }
}

class ColorCheckBox extends StatefulWidget {
  final List<ProductColor> list;

  const ColorCheckBox(
    this.list, {
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ColorCheckBoxState();
}

class _ColorCheckBoxState extends State<ColorCheckBox> {
  int _active = 0;
  @override
  Widget build(BuildContext context) {
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
            widget.list.length,
            (index) {
              final data = widget.list[index];
              return customRadioButton(data.color, index);
            },
          ).toList(),
        )
      ],
    );
  }

  Widget customRadioButton(int color, int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: SizedBox(
        width: 33,
        height: 33,
        child: OutlinedButton(
          onPressed: () {
            setState(() {
              _active = index;
            });
          },
          style: OutlinedButton.styleFrom(
              primary: Colors.blue,
              padding: EdgeInsets.all(0),
              backgroundColor: Color(color),
              side: BorderSide(
                width: 1.5,
                color: (_active == index) ? Colors.green : MyColors.borderDark,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0))),
          child: (_active == index)
              ? Icon(
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

class Variant {
  final String size;
  final ProductColor color;
  final double price;

  Variant(this.size, this.color, {this.price = 0.0});
}

class ProductColor {
  final String name;
  final int color;
  ProductColor(this.name, this.color);
}
