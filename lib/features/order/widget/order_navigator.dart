import 'package:coffee_app/features/order/view/customize_view.dart';
import 'package:coffee_app/features/order/view/order_view.dart';
import 'package:coffee_app/features/order/view/product_details_view.dart';
import 'package:flutter/material.dart';

class OrderNavigator extends StatelessWidget {
  const OrderNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/order',
      onGenerateRoute: (settings) {
        Widget page;
        switch (settings.name) {
          case '/order':
            page = const OrderView();
            break;
          case '/details':
            page = const ProductDetailsView();
            break;
          case '/customize':
            page = const CustomizeView();
            break;
          default:
            page = const OrderView();
        }

        return MaterialPageRoute(builder: (_) => page);
      },
    );
  }
}
