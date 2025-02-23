class ProductData {
  final int? id;
  final String name;
  final String description;
  final double price;

  ProductData(
      {this.id,
      required this.name,
      required this.description,
      required this.price});

  ProductData.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        price = json['price'];

  Map<String, dynamic> toJson() {
    return {'name': name, 'description': description, 'price': price};
  }
}
