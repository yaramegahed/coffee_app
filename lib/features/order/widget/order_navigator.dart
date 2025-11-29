import 'package:coffee_app/features/cart/view/cart_view.dart';
import 'package:coffee_app/features/checkout/view/checkout_view.dart';
import 'package:coffee_app/features/order/view/customize_view.dart';
import 'package:coffee_app/features/order/view/order_view.dart';
import 'package:coffee_app/features/order/view/product_details_view.dart';
import 'package:flutter/material.dart';

import '../../../core/models/products_model.dart';

class OrderNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState>? navigatorKey;

  const OrderNavigator({super.key, this.navigatorKey});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: '/order',
      onGenerateRoute: (settings) {
        Widget page;

        switch (settings.name) {
          case '/order':
            page = const OrderView();
            break;

          case '/details':
            final product = settings.arguments as Product?;
            page = ProductDetailsView(product: product!);
            break;

          case '/customize':
            if (settings.arguments is Map<String, dynamic>) {
              final args = settings.arguments as Map<String, dynamic>;
              final product = args["product"] as Product;
              final orderId = args["orderId"] as String;
              page = CustomizeView(product: product, orderId: orderId);
            } else {
              page = const OrderView();
            }
            break;

          case '/cart':
            page = CartView();
            break;
          case '/checkout':
            page = CheckoutView();
            break;

          default:
            page = const OrderView();
        }

        return MaterialPageRoute(builder: (_) => page);
      },
    );
  }
}
