class CartProductModel {
  String?name, image,price, productId;
  int? count;

  CartProductModel({this.name,this.image,this.price,this.count,this.productId});

  CartProductModel.fromJson(Map<dynamic, dynamic> json){
    name = json['name'];
    image = json['image'];
    count = json['count'];
    price = json['price'];
    productId = json['productId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'count': count,
      'productId': productId,
    };
  }

}