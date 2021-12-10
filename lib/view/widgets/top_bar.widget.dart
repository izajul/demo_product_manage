import 'package:demo_goods_manage_flutter_app/utility/appearance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'buttons.widget.dart';

class TopBar extends StatelessWidget {
  final onBackPress;

  const TopBar(this.onBackPress, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              onPrimary: MyColors.primary,
              primary: Colors.white,
              onSurface: Colors.blueGrey,
              side: const BorderSide(color: Color(0x00000000), width: 1),
              elevation: 3,
              fixedSize: const Size(45, 45),
              shadowColor: Colors.blueGrey,
              shape: const CircleBorder()),
          onPressed: () {},
          child: const Icon(Icons.arrow_back_outlined),
        ),
        ButtonOutLine(
          onPress: () {},
          widht: 100,
          text: const Text(
            "Logo",
            style: TextStyle(
                color: MyColors.textDark,
                fontWeight: FontWeight.w900,
                fontSize: 18),
          ),
        )
      ],
    );
  }
}
