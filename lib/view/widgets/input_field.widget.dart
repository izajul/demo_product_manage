import 'package:demo_goods_manage_flutter_app/utility/appearance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormFieldRounded extends StatelessWidget {
  final double widht;
  final String hintText;
  final TextInputType inputType;
  final TextEditingController controller;
  final String? validateText;
  final String? label;
  final bool isMultiline;
  TextStyle? labelStyle;

  FormFieldRounded(
      {this.widht = double.infinity,
      this.hintText = "Ex. Hint",
      Key? key,
      this.inputType = TextInputType.text,
      required this.controller,
      this.validateText,
      this.label,
      this.labelStyle,
      this.isMultiline = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          label != null
              ? Container(
                  padding: const EdgeInsets.only(bottom: 5),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    label!,
                    style: labelStyle ?? textTheme.subtitle1,
                  ),
                )
              : const SizedBox(),
          SizedBox(
            width: widht,
            child: TextFormField(
              autofocus: false,
              style: textTheme.bodyText1,
              controller: controller,
              textAlign: TextAlign.start,
              cursorColor: MyColors.textDark,
              validator: validateText == null
                  ? null
                  : (value) {
                      if (value == null || value.isNotEmpty)
                        return validateText;
                    },
              // keyboardType: inputType,
              maxLines: isMultiline ? null : 1,
              minLines: isMultiline ? 5 : 1,
              keyboardType: isMultiline ? TextInputType.multiline : inputType,
              obscureText:
                  inputType == TextInputType.visiblePassword ? true : false,
              decoration: InputDecoration(
                isDense: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: MyColors.textDark, width: 1.5),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: MyColors.textDark, width: 1.5),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                hintText: hintText,
              ),
            ),
          )
        ],
      ),
    );
  }
}
