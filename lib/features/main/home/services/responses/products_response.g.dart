// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductSizesResponse _$ProductSizesResponseFromJson(
        Map<String, dynamic> json) =>
    ProductSizesResponse(
      json['sizes'] as String?,
    );

Map<String, dynamic> _$ProductSizesResponseToJson(
        ProductSizesResponse instance) =>
    <String, dynamic>{
      'sizes': instance.size,
    };

ProductColorsResponse _$ProductColorsResponseFromJson(
        Map<String, dynamic> json) =>
    ProductColorsResponse(
      json['colors'] as String?,
    );

Map<String, dynamic> _$ProductColorsResponseToJson(
        ProductColorsResponse instance) =>
    <String, dynamic>{
      'colors': instance.color,
    };

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      json['product_id'] as String?,
      json['title'] as String?,
      json['description'] as String?,
      (json['price'] as num?)?.toDouble(),
      (json['discount_price'] as num?)?.toDouble(),
      json['imageUrl'] as String?,
      (json['sizes'] as List<dynamic>?)
          ?.map((e) => ProductSizesResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['colors'] as List<dynamic>?)
          ?.map(
              (e) => ProductColorsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'product_id': instance.pid,
      'title': instance.title,
      'description': instance.desc,
      'price': instance.price,
      'discount_price': instance.discPrice,
      'imageUrl': instance.productUrl,
      'sizes': instance.sizes,
      'colors': instance.colors,
    };
