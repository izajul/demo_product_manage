import 'dart:convert';

import 'package:demo_goods_manage_flutter_app/store/store.dart';
import 'package:demo_goods_manage_flutter_app/utility/appearance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class MultipleImagePicker extends StatelessWidget {
  MultipleImagePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Store>(context).addProductStore;
    return Observer(
        builder: (_) => GridView.count(
              crossAxisCount: 2,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              childAspectRatio: 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                ...List.generate(store.images.length, (index) {
                  final img = store.images[index];
                  return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: MyColors.borderDark,
                          border: Border.all(
                            color: MyColors.borderDark,
                          )),
                      alignment: Alignment.center,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          img.isEmpty
                              ? Image.asset("imgs/default.jpg")
                              : Image.memory(base64.decode(img)),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                              onPressed: () => store.deleteImage(index),
                              icon: Icon(
                                Icons.cancel,
                                color: Colors.red[300],
                                size: 27,
                              ),
                            ),
                          )
                        ],
                      ));
                }),
                GestureDetector(
                  onTap: () {
                    store.addImages();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: MyColors.borderDark,
                        )),
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        const Positioned(
                            left: 0,
                            right: 0,
                            top: 0,
                            bottom: 20,
                            child: Center(
                              child: Image(
                                image: AssetImage('imgs/default.jpg'),
                                width: 60,
                                height: 60,
                                fit: BoxFit.contain,
                              ),
                            )),
                        Positioned(
                            top: 60,
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Text(
                                store.images.isEmpty
                                    ? "Brows Gallery"
                                    : "Brows More..",
                                style: const TextStyle(
                                    color: Color(0x8b003b68),
                                    fontWeight: FontWeight.w700),
                              ),
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ));
  }
}

/*class _MultipleImagePickerState extends State<MultipleImagePicker> {
  List<XFile>? _files = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ;
  }


}*/
