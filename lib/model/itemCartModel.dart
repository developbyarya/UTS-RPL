import 'package:posapp/model/ItemModel.dart';

class ItemCartModel extends ItemModel{
  int quantity;

  ItemCartModel({required super.id, required super.name, required super.imagePath, required super.price, required super.stock, required this.quantity});
}