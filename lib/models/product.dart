class Product {
  final String name;
  final String description;
  final String image;
  final double price;
  final String unit;
  final double rating;
  int countincart ;
  int totalprice;

   Product({
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.unit,
    required this.rating,
    this.countincart = 0,
    this.totalprice =0,
  });
}