import 'dart:io';

import 'package:demo_goods_manage_flutter_app/utility/appearance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MultipleImagePicker extends StatefulWidget {
  const MultipleImagePicker({Key? key}) : super(key: key);

  @override
  _MultipleImagePickerState createState() => _MultipleImagePickerState();
}

class _MultipleImagePickerState extends State<MultipleImagePicker> {
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
    return GridView.count(
      crossAxisCount: 2,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      childAspectRatio: 1,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: [
        ...List.generate(_files?.length ?? 0, (index) {
          final img = _files?[index];
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
                  img == null
                      ? Image.asset("imgs/default.jpg")
                      : Image.file(File(img.path)),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      onPressed: () {
                        removeItem(index);
                      },
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
          onTap: pickImages,
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
                        (_files == null || _files?.isEmpty == true)
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
    );
  }

  void pickImages() async {
    final List<XFile>? images = await ImagePicker().pickMultiImage();

    setState(() {
      _files = images;
    });
  }

  void removeItem(int index) {
    setState(() {
      _files?.removeAt(index);
    });
  }
}
