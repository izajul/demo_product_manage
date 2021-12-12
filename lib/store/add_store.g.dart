// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddProductStore on _AddProductStore, Store {
  final _$nameAtom = Atom(name: '_AddProductStore.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$descriptionAtom = Atom(name: '_AddProductStore.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$imagesAtom = Atom(name: '_AddProductStore.images');

  @override
  ObservableList<String> get images {
    _$imagesAtom.reportRead();
    return super.images;
  }

  @override
  set images(ObservableList<String> value) {
    _$imagesAtom.reportWrite(value, super.images, () {
      super.images = value;
    });
  }

  final _$variantsAtom = Atom(name: '_AddProductStore.variants');

  @override
  ObservableList<Variant> get variants {
    _$variantsAtom.reportRead();
    return super.variants;
  }

  @override
  set variants(ObservableList<Variant> value) {
    _$variantsAtom.reportWrite(value, super.variants, () {
      super.variants = value;
    });
  }

  final _$statusAtom = Atom(name: '_AddProductStore.status');

  @override
  bool get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(bool value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$addImagesAsyncAction = AsyncAction('_AddProductStore.addImages');

  @override
  Future<dynamic> addImages() {
    return _$addImagesAsyncAction.run(() => super.addImages());
  }

  final _$deleteImageAsyncAction = AsyncAction('_AddProductStore.deleteImage');

  @override
  Future<dynamic> deleteImage(int index) {
    return _$deleteImageAsyncAction.run(() => super.deleteImage(index));
  }

  final _$addNameAsyncAction = AsyncAction('_AddProductStore.addName');

  @override
  Future<dynamic> addName(String value) {
    return _$addNameAsyncAction.run(() => super.addName(value));
  }

  final _$addDescAsyncAction = AsyncAction('_AddProductStore.addDesc');

  @override
  Future<dynamic> addDesc(String value) {
    return _$addDescAsyncAction.run(() => super.addDesc(value));
  }

  final _$addVariantAsyncAction = AsyncAction('_AddProductStore.addVariant');

  @override
  Future<dynamic> addVariant(Variant value) {
    return _$addVariantAsyncAction.run(() => super.addVariant(value));
  }

  final _$deleteVariantAsyncAction =
      AsyncAction('_AddProductStore.deleteVariant');

  @override
  Future<dynamic> deleteVariant(int index) {
    return _$deleteVariantAsyncAction.run(() => super.deleteVariant(index));
  }

  final _$changeSizeAsyncAction = AsyncAction('_AddProductStore.changeSize');

  @override
  Future<dynamic> changeSize(String value, int index) {
    return _$changeSizeAsyncAction.run(() => super.changeSize(value, index));
  }

  final _$changeColorAsyncAction = AsyncAction('_AddProductStore.changeColor');

  @override
  Future<dynamic> changeColor(ProductColor value, int index) {
    return _$changeColorAsyncAction.run(() => super.changeColor(value, index));
  }

  final _$addProductAsyncAction = AsyncAction('_AddProductStore.addProduct');

  @override
  Future<void> addProduct() {
    return _$addProductAsyncAction.run(() => super.addProduct());
  }

  @override
  String toString() {
    return '''
name: ${name},
description: ${description},
images: ${images},
variants: ${variants},
status: ${status}
    ''';
  }
}
