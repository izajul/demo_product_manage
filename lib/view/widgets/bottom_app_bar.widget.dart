import 'package:demo_goods_manage_flutter_app/utility/appearance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'buttons.widget.dart';

class BottomBar extends StatelessWidget {
  final onClick;
  final text;

  const BottomBar({@required this.onClick, this.text = "Button", Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: MyColors.backgroundWhite,
      elevation: 0,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 30, right: 30, bottom: 20, top: 10),
        child: ButtonElevated(
          onPress: onClick,
          text: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
