class CategoryProductModel {
  int? categoryId;
  int? productId;

  CategoryProductModel({
    this.categoryId,
    this.productId,
  });

  factory CategoryProductModel.fromJson(Map<String, dynamic> data) {
    return CategoryProductModel(
      categoryId: data['category_id'],
      productId: data['product_id'],
    );
  }
}
