class AddressModel {
  String? id;
  String? name;
  String? address;
  String? city;
  String? street;
  String? zip;
  String? country;
  bool? isCheck;

  AddressModel(
      {this.id,
        this.name,
        this.address,
        this.city,
        this.country,
        this.street,
        this.zip,
        this.isCheck});

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    city = json['city'];
    street = json['street'];
    zip = json['zip'];
    country = json['country'];
    isCheck = json['isCheck'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'address': address,
      'city': city,
      'street': street,
      'zip': zip,
      'country': country,
      'isCheck': isCheck,
    };
  }
}