import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/core/api_services/api_services.dart';
import 'package:flutter/foundation.dart';

import '../models/products_model.dart';

class ProductRepo {
  final ApiServices apiServices = ApiServices();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Product>> getProducts({required String category}) async {
    try {
      // 1️⃣ جلب البيانات من API
      final data = await apiServices.get(endPoint: "/products?category=$category");

      // 2️⃣ تحويل البيانات لنماذج Product
      final productsModel = ProductsModel.fromJson(data);
      final products = productsModel.products;

      // 3️⃣ تحديث Firestore بالأسعار
      for (var product in products) {
        final docRef = _firestore.collection('products').doc(product.id.toString());

        // حدد السعر الافتراضي هنا حسب حاجتك
        const defaultPrice = 6.99;

        await docRef.set({
          'price': defaultPrice,
          'imageUrl': product.imageUrl,
        }, SetOptions(merge: true));
      }

      return products;
    } catch (e) {
      if (kDebugMode) {
        print("Error in getProducts: $e");
      }
      return [];
    }
  }
}
