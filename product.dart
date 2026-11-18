class Product {
  String name;
  double price;
  String description;
  String imageUrl;
  bool isFavorite;

  Product({
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
    this.isFavorite = false,
  });
}
