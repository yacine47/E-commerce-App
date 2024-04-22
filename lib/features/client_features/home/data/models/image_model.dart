class ImageModel {
  int? id;
  String? path;
  int? productId;

  ImageModel({this.id, this.path, this.productId});

  factory ImageModel.fromJson(Map<String,dynamic> data) {
    return ImageModel(
      id: data['id'],
      path: data['path'],
      productId: data['productId'],
    );
  }
}

// 'id','path','product_id'