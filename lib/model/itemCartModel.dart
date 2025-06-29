import 'package:posapp/model/ItemModel.dart';

class ItemCartModel extends ItemModel {
  int quantity;

  ItemCartModel({
    required String id,
    required String name,
    required String imagePath,
    required int price,
    required int discount,
    required String sourceName,
    required int purchasePrice,
    required int stock,
    required String barcode,
    required this.quantity,
  }) : super(
    id: id,
    name: name,
    imagePath: imagePath,
    price: price,
    discount: discount,
    sourceName: sourceName,
    purchasePrice: purchasePrice,
    stock: stock,
    barcode: barcode,
  );
}