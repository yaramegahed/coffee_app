class ProductsModel {
  ProductsModel({
    required this.totalResults,
    required this.currentPage,
    required this.totalPages,
    required this.products,
  });

  final int? totalResults;
  final int? currentPage;
  final int? totalPages;
  final List<Product> products;

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      totalResults: json["totalResults"],
      currentPage: json["currentPage"],
      totalPages: json["totalPages"],
      products: json["products"] == null
          ? []
          : List<Product>.from(
              json["products"]!.map((x) => Product.fromJson(x))),
    );
  }
}

class Product {
  Product({
    required this.imageUrl,
    required this.id,
    required this.category,
    required this.name,
    required this.isAvailable,
  });

  final int? id;
  final String? category;
  final String? name;
  final String imageUrl;
  final bool? isAvailable;
  static const Map<String, String> defaultImages = {
    "Espresso": "https://thumbs.dreamstime.com/b/coffee-cup-beans-14770192.jpg",
    "Cappuccino":
        "https://thelittlestcrumb.com/wp-content/uploads/salted-caramel-macchiato-6.jpg",
    "Latte":
        "https://img.freepik.com/free-photo/latte-coffee-cup_74190-1194.jpg",
    "Americano":
        "https://images.pexels.com/photos/34399640/pexels-photo-34399640/free-photo-of-minimalist-glass-espresso-cup-on-wooden-table.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "Mocha":
        "https://media.istockphoto.com/id/1371303553/photo/coffee-and-chocolate-cocktail-with-whipped-cream.jpg?s=612x612&w=0&k=20&c=O3ZIVpWd6ADADg0ELcjkqD1qkWPJsvKE4AU_yoLdm5Y=",
    "Macchiato":
        "https://media.gettyimages.com/id/1301829659/photo/a-shot-of-macchiato-on-wooden-cutting-board-on-black-background.jpg?s=612x612&w=gi&k=20&c=O87HxnAZZtpE46CG2i7ijcrfLmJ8UDBsCZxmuuiNLds=",
    "Cortado":
        "https://cdn.shopify.com/s/files/1/1221/3516/files/cortado-coffee.jpg?v=1661528516",
    "Flat White":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8dyNFMBL69wb_y3ZvJgnniXEdDEqA3VOxBw&s",
    "Iced Coffee":
        "https://frostingandfettuccine.com/wp-content/uploads/2022/12/Caramel-Iced-Coffee-6.jpg",
    "Cold Brew":
        "https://www.thetastybiteblog.com/wp-content/uploads/2024/07/blue-bottle-cold-brew-coffee-5-scaled.jpg"
  };

  factory Product.fromJson(Map<String, dynamic> json) {
    final name = json["name"] as String?;
    return Product(
      imageUrl: json["imageUrl"] ??
          defaultImages[name] ??
          "https://frostingandfettuccine.com/wp-content/uploads/2022/12/Caramel-Iced-Coffee-6.jpg",
      id: json["id"],
      category: json["category"],
      name: json["name"],
      isAvailable: json["isAvailable"],
    );
  }
}
