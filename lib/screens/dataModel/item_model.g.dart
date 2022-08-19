// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => ItemModel(
      json['name'] as String,
      json['image'] as String,
      (json['price'] as num).toDouble(),
      json['stock'],
      json['createdate'],
      json['category'] as String,
    );

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'price': instance.price,
      'stock': instance.stock,
      'createdate': instance.createdate,
      'category': instance.category,
    };
