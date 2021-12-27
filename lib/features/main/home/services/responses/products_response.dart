import 'package:json_annotation/json_annotation.dart';

part 'products_response.g.dart';

class ProductSizesResponse {
  String? size;
  ProductSizesResponse(this.size);
}

class ProductColorsResponse {
  String? color;
  ProductColorsResponse(this.color);
}

@JsonSerializable()
class ProductResponseData {
  @JsonKey(name: "product_id")
  String? pid;
  @JsonKey(name: "brand")
  String? brand;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  String? desc;
  @JsonKey(name: "price")
  double? price;
  @JsonKey(name: "discount_price")
  double? discPrice;
  @JsonKey(name: "image_url")
  String? productUrl;
  @JsonKey(name: "sizes")
  List? sizes;
  @JsonKey(name: "colors")
  List? colors;

  ProductResponseData(this.pid,this.brand, this.title, this.desc, this.price,
      this.discPrice, this.productUrl, this.sizes, this.colors);

  Map<String, dynamic> toJson() => _$ProductResponseDataToJson(this);
  factory ProductResponseData.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseDataFromJson(json);
}

class ProductResponse {
  List<ProductResponseData>? productResponseData;
  ProductResponse(this.productResponseData);
}
