class CategoryViewModel{
  String? name, image;

  CategoryViewModel({this.name,this.image});

  CategoryViewModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
    };
  }

}