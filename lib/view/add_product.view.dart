import 'package:demo_goods_manage_flutter_app/view/widgets/image_picker.widget.dart';
import 'package:demo_goods_manage_flutter_app/view/widgets/input_field.widget.dart';
import 'package:demo_goods_manage_flutter_app/view/widgets/product_variant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  static const routeName = "add_product";
  const AddProduct({Key? key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
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
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "Add Product",
                      style: textTheme.headline6,
                    ),
                  ),
                ),
                Text(
                  "Product Images ",
                  style: textTheme.subtitle1,
                ),
                const SizedBox(
                  height: 5,
                ),
                const MultipleImagePicker(),
                const SizedBox(
                  height: 15,
                ),
                FormFieldRounded(
                  controller: _nameController,
                  validateText: "Product Name Can't be Empty!",
                  label: "Product Name",
                  hintText: "Enter Product Name",
                ),
                FormFieldRounded(
                  controller: _nameController,
                  validateText: "Product Description Can't be Empty!",
                  label: "Product Description",
                  hintText: "Enter Product Description",
                  isMultiline: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                const ProductVariant(),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 5),
                      /*     side:
                        const BorderSide(color: MyColors.borderDark, width: 1),*/
                      maximumSize: const Size(150, 40),
                      shadowColor: Colors.blueGrey,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                    ),
                    onPressed: () {},
                    child: const Text("Submit")),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
