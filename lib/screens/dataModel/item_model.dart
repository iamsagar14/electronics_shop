import 'package:json_annotation/json_annotation.dart';
part 'item_model.g.dart';

@JsonSerializable()
class ItemModel {
  final String name;
  final String image;
  final double price;
  final int stock;
  final DateTime createdate;
  final String category;
  ItemModel(this.name, this.image, this.price, this.stock, this.createdate,
      this.category);
  factory ItemModel.fromjson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);
  Map<String, dynamic> tojson() => _$ItemModelToJson(this);
}
