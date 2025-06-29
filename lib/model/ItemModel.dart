class ItemModel {
  final String id;
  final String name;
  final String imagePath;
  final int price;
  final int discount;
  final String sourceName;
  final int purchasePrice;
  final int stock;
  final String barcode;

  ItemModel({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.price,
    required this.discount,
    required this.sourceName,
    required this.purchasePrice,
    required this.stock,
    required this.barcode,
  });
}
