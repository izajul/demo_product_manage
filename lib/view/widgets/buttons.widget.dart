import 'package:demo_goods_manage_flutter_app/utility/appearance.dart';
import 'package:flutter/material.dart';

class ButtonWithRipple extends StatelessWidget {
  final Text? text;
  final onPress;
  final Color? background;
  final Color? rippleColor;
  final BorderRadius? borderRadius;
  final double? height;
  final double? width;
  final Alignment? textAlignment;

  const ButtonWithRipple(
      {Key? key,
      this.text,
      required this.onPress,
      this.background,
      this.rippleColor,
      this.borderRadius,
      this.height,
      this.width,
      this.textAlignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 40,
      width: width ?? double.infinity,
      child: Material(
        color: background ?? Colors.blue,
        borderRadius: borderRadius ?? BorderRadius.circular(50.0),
        child: InkWell(
          borderRadius: borderRadius ?? BorderRadius.circular(50.0),
          splashColor: rippleColor ?? Colors.black54,
          child: Align(
            alignment: textAlignment ?? Alignment.center,
            child: text,
          ),
          onTap: onPress,
        ),
      ),
    );
  }
}

abstract class MyButton extends StatelessWidget {
  const MyButton(Key? key, this.onPress, this.borderRadious, this.text,
      this.borderColor, this.padding, this.widht, this.margin)
      : super(key: key);

  final EdgeInsetsGeometry margin;
  final onPress;
  final double? borderRadious;
  final Text? text;
  final Color? borderColor;
  final double padding;
  final double widht;
}

class ButtonOutLine extends MyButton {
  const ButtonOutLine(
      {Key? key,
      onPress,
      double? borderRadious,
      Text? text,
      Color? borderColor,
      double padding = 5.0,
      double widht = double.infinity,
      margin = const EdgeInsets.all(0)})
      : super(key, onPress, borderRadious, text, borderColor, padding, widht,
            margin);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: SizedBox(
        width: widht,
        height: 33,
        child: OutlinedButton(
          onPressed: onPress,
          style: OutlinedButton.styleFrom(
              padding: EdgeInsets.all(padding),
              primary: Colors.blue,
              side: BorderSide(width: 1.5, color: borderColor ?? Colors.black),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadious ?? 50.0))),
          child: text ?? const Text("button"),
        ),
      ),
    );
  }
}

class ButtonElevated extends MyButton {
  const ButtonElevated(
      Key? key,
      onPress,
      double? borderRadious,
      Text? text,
      Color? borderColor,
      double padding,
      double widht,
      EdgeInsetsGeometry margin)
      : super(key, onPress, borderRadious, text, borderColor, padding, widht,
            margin);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widht,
      height: 40,
      child: ElevatedButton(
        child: text ?? const Text("Button"),
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: MyColors.primary,
          onSurface: Colors.grey,
          side: BorderSide(
              color: borderColor ?? const Color(0x00000000), width: 1),
          elevation: 10,
          minimumSize: const Size(150, 50),
          shadowColor: Colors.blueGrey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        onPressed: onPress,
      ),
    );
  }
}
