class Colors {
  String color;
  Colors(this.color);
}

class Sizes {
  String size;
  Sizes(this.size);
}

class Product {
  String pid;
  String title;
  String desc;
  double price;
  double discPrice;
  String productUrl;
  List<Sizes> sizes;
  List<Colors> colors;
  Product(this.pid, this.title, this.desc, this.price, this.discPrice,
      this.productUrl,this.sizes,this.colors);
}
