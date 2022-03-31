import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';

class ProductModel {
  String? name, image, description, size, price, productId;
  Color? color;

  ProductModel({
    this.price,
    this.name,
    this.image,
    this.size,
    this.description,
    this.color,
    this.productId,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    description = json['description'];
    color = HexColor('${json['color']}');
    size = json['size'];
    price = json['price'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'color': color,
      'size': size,
      'price': price,
      'productId': productId,
    };
  }
}