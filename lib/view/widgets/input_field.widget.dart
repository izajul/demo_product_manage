import 'package:demo_goods_manage_flutter_app/utility/appearance.dart';
import 'package:flutter/material.dart';

class FormFieldFullRounded extends StatelessWidget {
  final double widht;
  final onChanged;
  final String hintText;
  final TextInputType inputType;

  const FormFieldFullRounded(
      {this.widht = double.infinity,
      this.onChanged,
      this.hintText = "Ex. Hint",
      Key? key,
      this.inputType = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: widht,
      child: TextFormField(
        textAlign: TextAlign.center,
        cursorColor: MyColors.textDark,
        onChanged: onChanged,
        keyboardType: inputType,
        obscureText: inputType == TextInputType.visiblePassword ? true : false,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: MyColors.textDark, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: MyColors.textDark, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
              color: MyColors.textDark, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
