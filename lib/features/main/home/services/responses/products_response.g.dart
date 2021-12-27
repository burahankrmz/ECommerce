// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponseData _$ProductResponseDataFromJson(Map<String, dynamic> json) =>
    ProductResponseData(
      json['product_id'] as String?,
      json['brand'] as String?,
      json['title'] as String?,
      json['description'] as String?,
      (json['price'] as num?)?.toDouble(),
      (json['discount_price'] as num?)?.toDouble(),
      json['image_url'] as String?,
      json['sizes'] as List<dynamic>?,
      json['colors'] as List<dynamic>?,
    );

Map<String, dynamic> _$ProductResponseDataToJson(
        ProductResponseData instance) =>
    <String, dynamic>{
      'product_id': instance.pid,
      'brand': instance.brand,
      'title': instance.title,
      'description': instance.desc,
      'price': instance.price,
      'discount_price': instance.discPrice,
      'image_url': instance.productUrl,
      'sizes': instance.sizes,
      'colors': instance.colors,
    };
