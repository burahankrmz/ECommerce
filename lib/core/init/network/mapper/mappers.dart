// ignore: constant_identifier_names
import 'package:ecommerce/features/main/home/model/product_model.dart';
import 'package:ecommerce/features/main/home/services/responses/products_response.dart';
import 'package:ecommerce/core/extensions/non_nullable_extension.dart';

// ignore: constant_identifier_names
const EMPTY = "";
// ignore: constant_identifier_names
const ZERO = 0;
// ignore: constant_identifier_names
const DOUBLEZERO = 0.0;

extension ProductSizesResponseMapper on ProductSizesResponse? {
  Sizes toDomain() {
    return Sizes(this?.size?.orEmpty() ?? EMPTY);
  }
}

extension ProductColorsResponseMapper on ProductColorsResponse? {
  Colors toDomain() {
    return Colors(this?.color?.orEmpty() ?? EMPTY);
  }
}

extension ProductResponseDataMapper on ProductResponseData? {
  ProductData toDomain() {
    return ProductData(
      this?.pid?.orEmpty() ?? EMPTY,
      this?.title?.orEmpty() ?? EMPTY,
      this?.desc?.orEmpty() ?? EMPTY,
      this?.price?.orDoubleZero() ?? DOUBLEZERO,
      this?.discPrice?.orDoubleZero() ?? DOUBLEZERO,
      this?.productUrl?.orEmpty() ?? EMPTY,
      this?.sizes ?? [],
      this?.colors ?? [],
    );
  }
}

extension ProductResponseMapper on ProductResponse? {
  Products toDomain() {
    List<ProductData> mappedServices =
        (this?.productResponseData?.map((productResponseData) => productResponseData.toDomain()) ??
                const Iterable.empty())
            .cast<ProductData>()
            .toList();
    return Products(mappedServices);
  }
}
