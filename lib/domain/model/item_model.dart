import 'package:posapp/model/ItemModel.dart' as PresentationModel;

class ItemModel {
  final String id;
  final String name;
  final double price;
  final int discount;
  final String sourceName;
  final double purchasePrice;
  final int stock;
  final String barcode;
  String? imageUrl;
  final bool isAvailable;

  ItemModel({
    required this.id,
    required this.name,
    required this.price,
    required this.discount,
    required this.sourceName,
    required this.purchasePrice,
    required this.stock,
    required this.barcode,
    this.imageUrl,
    this.isAvailable = true,
  });

  // Factory constructor to create ItemModel from JSON
  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'].toString(),
      name: json['name'] as String,
      price: double.parse(json['priceHistory'][0]['price'].toString()),
      discount: json['discount'] != null ? json['discount'] as int : 0,
      sourceName: "",
      purchasePrice: double.parse(json['priceHistory'][0]['price'].toString()),
      stock: json['stock'] as int,
      barcode: json['id'].toString(),
      imageUrl: json['imageUrl'] as String?,
      isAvailable: json['isAvailable'] as bool? ?? true,
    );
  }

  // Convert ItemModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'discount': discount,
      'sourceName': sourceName,
      'purchasePrice': purchasePrice,
      'stock': stock,
      'barcode': barcode,
      'imageUrl': imageUrl,
      'isAvailable': isAvailable,
    };
  }

  // Convert to from ItemModel to Model 
  static PresentationModel.ItemModel toPresentationModel(ItemModel item) {
    return PresentationModel.ItemModel(
        id: item.id,
        name: item.name,
        price: item.price.toInt(),
        discount: item.discount,
        sourceName: item.sourceName,
        purchasePrice: item.purchasePrice.toInt(),
        stock: item.stock,
        barcode: item.barcode,
        imagePath: item.imageUrl ?? '',
    );
  }
} 