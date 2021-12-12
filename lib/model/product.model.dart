import 'dart:convert';

class ProductModel {
  String name;
  String description;

  /// will be store as base64
  final List<String> images;
  final List<Variant> variants;

  ProductModel(
      {this.name = "",
      this.description = "",
      required this.images,
      required this.variants});

  factory ProductModel.fromJsonStr(String jsonStr) =>
      ProductModel.fromJson(json.decode(jsonStr));

  factory ProductModel.fromJson(Map<String, dynamic> jData) {
    var vList =
        (jData["variants"] as List).map((e) => Variant.fromJson(e)).toList();
    var imgs = (json.encode(jData["images"]) as List)
        .map((e) => e.toString())
        .toList();
    return ProductModel(
        name: jData["name"],
        description: jData["description"],
        images: imgs,
        variants: vList);
  }

  Map toJson() {
    Map<String, dynamic> map = {};
    map["name"] = name;
    map["description"] = description;
    map["images"] = json.encode(images);
    map["variants"] = variants.map((e) => e.toJson()).toList();
    return map;
  }
}

class Variant {
  String size;
  String price;
  ProductColor color;

  Variant(this.size, this.color, {this.price = ""});

  factory Variant.fromJson(Map<String, dynamic> json) =>
      Variant(json["size"], ProductColor.fromJson(json["color"]),
          price: json["price"]);

  Map toJson() {
    Map<String, dynamic> map = {};
    map["size"] = size;
    map["color"] = color.toJson();
    map["price"] = price;
    return map;
  }
}

class ProductColor {
  String name;
  int code;
  ProductColor(this.name, this.code);

  factory ProductColor.fromJson(Map<String, dynamic> json) =>
      ProductColor(json["name"], json["code"]);

  Map toJson() {
    Map<String, dynamic> map = {};
    map["name"] = name;
    map["code"] = code;
    return map;
  }
}
