import 'package:demo_goods_manage_flutter_app/view/widgets/image_picker.widget.dart';
import 'package:demo_goods_manage_flutter_app/view/widgets/input_field.widget.dart';
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
