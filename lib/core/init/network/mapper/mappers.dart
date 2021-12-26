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

extension ProductResponseMapper on ProductResponse? {
  Product toDomain() {
    List<Colors> mappedColors =
        (this?.colors?.map((colors) => colors.toDomain()) ??
                const Iterable.empty())
            .cast<Colors>()
            .toList();
    List<Sizes> mappedSizes =
        (this?.sizes?.map((sizes) => sizes.toDomain()) ??
                const Iterable.empty())
            .cast<Sizes>()
            .toList();
    return Product(
      this?.pid?.orEmpty() ?? EMPTY,
      this?.title?.orEmpty() ?? EMPTY,
      this?.desc?.orEmpty() ?? EMPTY,
      this?.price?.orDoubleZero() ?? DOUBLEZERO,
      this?.discPrice?.orDoubleZero() ?? DOUBLEZERO,
      this?.productUrl?.orEmpty() ?? EMPTY,
      mappedSizes,
      mappedColors,
    );
  }
}
