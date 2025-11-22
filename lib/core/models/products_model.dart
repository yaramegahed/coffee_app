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
    required this.price,
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
  final double price;
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
        "https://www.thetastybiteblog.com/wp-content/uploads/2024/07/blue-bottle-cold-brew-coffee-5-scaled.jpg",
    "Chocolate Chip":
        "https://img.freepik.com/free-photo/side-view-cookies-chocolate-cutting-board-sackcloth-blue-background_141793-11379.jpg?semt=ais_hybrid&w=740&q=80",
    "Oatmeal Raisin":
        "https://media.istockphoto.com/id/155158077/photo/oatmeal-raisin-cookies.jpg?s=612x612&w=0&k=20&c=jDb6Cdo_zccix36bF4otNTrnERlKl-z7974zh66PVWQ=",
    "Peanut Butter":
        "https://www.rainbownourishments.com/wp-content/uploads/2023/10/vegan-peanut-butter-cookies-1-500x500.jpg",
    "White Chocolate Macadamia":
        "https://media.istockphoto.com/id/175535621/photo/macadamia-nut-and-white-chocolate-cookies.jpg?s=612x612&w=0&k=20&c=Sujp59JmfNkjHGUgQ3iIBGwhQk3TejJJyvfyA3vPznY=",
    "Snickerdoodle":
        "https://www.cookingclassy.com/wp-content/uploads/2017/06/snickerdoodles-40.jpg",
    "Sugar Cookie":
        "https://www.allrecipes.com/thmb/XSJoH98eVnTCnaE6lTcDpYHbalw=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/9870-easy-sugar-cookies-mfs356-1-8c317695c5b645a48f6b20d1b97d3c93.jpg",
    "Double Chocolate":
        "https://thedinnerbell.recipes/wp-content/uploads/2024/07/Double-Chocolate-Chip-Cookies-Soft-Double-Chocolate-Chip-Cookies-33663.jpg",
    "Gingerbread":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbRbmP3YNN5VRbpUdIj_SJl9ySVncpNFlBRg&s",
    "Lemon Poppy Seed":
        "https://images.squarespace-cdn.com/content/v1/5e4a5d2f4e209873477bec60/1620831520725-4M9NKR6EN3DV5FHNPIZA/Capture.PNG",
    "Almond":
        "https://www.abakingjourney.com/wp-content/uploads/2018/04/Almond-Cookies-Feature-1-480x270.jpg",
  };
  static const Map<String, double> defaultPrices = {
    "Espresso": 3.50,
    "Cappuccino": 4.20,
    "Latte": 4.00,
    "Americano": 3.00,
    "Mocha": 4.50,
    "Macchiato": 4.30,
    "Cortado": 3.80,
    "Flat White": 4.10,
    "Iced Coffee": 3.90,
    "Cold Brew": 4.70,
    "Chocolate Chip": 2.50,
    "Oatmeal Raisin": 2.40,
    "Peanut Butter": 2.60,
    "White Chocolate Macadamia": 2.80,
    "Snickerdoodle": 2.50,
    "Sugar Cookie": 2.30,
    "Double Chocolate": 2.70,
    "Gingerbread": 2.45,
    "Lemon Poppy Seed": 2.55,
    "Almond": 2.60,
  };

  factory Product.fromJson(Map<String, dynamic> json) {
    final name = json["name"] as String?;
    return Product(
      imageUrl: defaultImages[name] ??
          "https://frostingandfettuccine.com/wp-content/uploads/2022/12/Caramel-Iced-Coffee-6.jpg",
      id: json["id"],
      category: json["category"],
      name: json["name"],
      isAvailable: json["isAvailable"],
      price: defaultPrices[name] ?? 6.99,
    );
  }
}
