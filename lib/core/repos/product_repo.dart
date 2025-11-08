import 'package:coffee_app/core/api_services/api_services.dart';

import '../models/products_model.dart';

class ProductRepo {
  final ApiServices apiServices = ApiServices();

  Future<List<Product>> getProducts() async {
    final data = await apiServices.get(endPoint: "/products");
    print(data);
    final productsModel = ProductsModel.fromJson(data);
    return productsModel.products;
  }
}
