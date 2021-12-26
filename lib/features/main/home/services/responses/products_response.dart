import 'package:json_annotation/json_annotation.dart';

part 'products_response.g.dart';

@JsonSerializable()
class ProductSizesResponse {
  @JsonKey(name: "sizes")
  String? size;
  ProductSizesResponse(this.size);

  Map<String, dynamic> toJson() => _$ProductSizesResponseToJson(this);
  factory ProductSizesResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductSizesResponseFromJson(json);
}

@JsonSerializable()
class ProductColorsResponse {
  @JsonKey(name: "colors")
  String? color;
  ProductColorsResponse(this.color);
  Map<String, dynamic> toJson() => _$ProductColorsResponseToJson(this);
  factory ProductColorsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductColorsResponseFromJson(json);
}

@JsonSerializable()
class ProductResponse {
  @JsonKey(name: "product_id")
  String? pid;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  String? desc;
  @JsonKey(name: "price")
  double? price;
  @JsonKey(name: "discount_price")
  double? discPrice;
  @JsonKey(name: "imageUrl")
  String? productUrl;
  @JsonKey(name: "sizes")
  List<ProductSizesResponse>? sizes;
  @JsonKey(name: "colors")
  List<ProductColorsResponse>? colors;
  ProductResponse(this.pid, this.title, this.desc, this.price, this.discPrice,
      this.productUrl, this.sizes, this.colors);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
}
