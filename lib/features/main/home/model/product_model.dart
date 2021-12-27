class Colors {
  String color;
  Colors(this.color);
}

class Sizes {
  String size;
  Sizes(this.size);
}

class ProductData {
  String pid;
  String brand;
  String title;
  String desc;
  double price;
  double discPrice;
  String productUrl;
  List sizes;
  List colors;
  ProductData(this.pid, this.brand,this.title, this.desc, this.price, this.discPrice,
      this.productUrl, this.sizes, this.colors);
}

class Products {
  List<ProductData> productData;
  Products(this.productData);
}
