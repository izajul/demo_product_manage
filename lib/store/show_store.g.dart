// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ShowStore on _ShowStore, Store {
  Computed<String>? _$sizeComputed;

  @override
  String get size => (_$sizeComputed ??=
          Computed<String>(() => super.size, name: '_ShowStore.size'))
      .value;
  Computed<String>? _$colorComputed;

  @override
  String get color => (_$colorComputed ??=
          Computed<String>(() => super.color, name: '_ShowStore.color'))
      .value;
  Computed<String>? _$priceComputed;

  @override
  String get price => (_$priceComputed ??=
          Computed<String>(() => super.price, name: '_ShowStore.price'))
      .value;
  Computed<ProductModel>? _$productComputed;

  @override
  ProductModel get product =>
      (_$productComputed ??= Computed<ProductModel>(() => super.product,
              name: '_ShowStore.product'))
          .value;

  final _$_productAtom = Atom(name: '_ShowStore._product');

  @override
  ProductModel? get _product {
    _$_productAtom.reportRead();
    return super._product;
  }

  @override
  set _product(ProductModel? value) {
    _$_productAtom.reportWrite(value, super._product, () {
      super._product = value;
    });
  }

  final _$_sizeAtom = Atom(name: '_ShowStore._size');

  @override
  String get _size {
    _$_sizeAtom.reportRead();
    return super._size;
  }

  @override
  set _size(String value) {
    _$_sizeAtom.reportWrite(value, super._size, () {
      super._size = value;
    });
  }

  final _$_colorAtom = Atom(name: '_ShowStore._color');

  @override
  String get _color {
    _$_colorAtom.reportRead();
    return super._color;
  }

  @override
  set _color(String value) {
    _$_colorAtom.reportWrite(value, super._color, () {
      super._color = value;
    });
  }

  final _$_priceAtom = Atom(name: '_ShowStore._price');

  @override
  String get _price {
    _$_priceAtom.reportRead();
    return super._price;
  }

  @override
  set _price(String value) {
    _$_priceAtom.reportWrite(value, super._price, () {
      super._price = value;
    });
  }

  final _$addProductAsyncAction = AsyncAction('_ShowStore.addProduct');

  @override
  Future<dynamic> addProduct(ProductModel product) {
    return _$addProductAsyncAction.run(() => super.addProduct(product));
  }

  final _$changeSizeAsyncAction = AsyncAction('_ShowStore.changeSize');

  @override
  Future<dynamic> changeSize(String v) {
    return _$changeSizeAsyncAction.run(() => super.changeSize(v));
  }

  final _$changeColorAsyncAction = AsyncAction('_ShowStore.changeColor');

  @override
  Future<dynamic> changeColor(String v) {
    return _$changeColorAsyncAction.run(() => super.changeColor(v));
  }

  final _$changePriceAsyncAction = AsyncAction('_ShowStore.changePrice');

  @override
  Future<dynamic> changePrice(String v) {
    return _$changePriceAsyncAction.run(() => super.changePrice(v));
  }

  @override
  String toString() {
    return '''
size: ${size},
color: ${color},
price: ${price},
product: ${product}
    ''';
  }
}
