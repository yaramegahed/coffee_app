import 'package:coffee_app/core/api_services/api_services.dart';
import 'package:flutter/foundation.dart';

import '../models/products_model.dart';

class ProductRepo {
  final ApiServices apiServices = ApiServices();
  // {{baseUrl}}/products?category=cookie
  Future<List<Product>> getProducts({required String category}) async {
    final data = await apiServices.get(endPoint: "/products?category=$category");
    if (kDebugMode) {
      print(data);
    }
    final productsModel = ProductsModel.fromJson(data);
    return productsModel.products;
  }
}
