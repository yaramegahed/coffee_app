import 'package:coffee_app/core/widget/quantity_container.dart';
import 'package:coffee_app/features/cart/cubit/order_cubit.dart';
import 'package:coffee_app/features/cart/widget/empty_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/order_state.dart';

class CartBody extends StatelessWidget {
  const CartBody({
    super.key,
    required this.userId,
  });

  final String userId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersCubit()..fetchOrders(userId),
      child: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          if (state is OrdersLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is OrdersSuccess) {
            final orders = state.orders;

            if (orders.isEmpty) {
              return const EmptyCart();
            }

            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// ---------- اسم المنتج + السعر ----------
                      Row(
                        children: [
                          Text(
                            order["productName"] ?? "Unknown",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins",
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "${order["price"] ?? 0}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      /// ---------- تفاصيل المنتج ----------
                      Text(
                        order["details"] ?? "",
                        style: const TextStyle(fontFamily: "Poppins"),
                      ),

                      const SizedBox(height: 20),

                      /// ---------- الكمية + السعر ----------
                      Row(
                        children: [
                          QuantityContainer(
                            initialQuantity: order["quantity"] ?? 1,
                            onChanged: (newQty) {
                              context.read<OrdersCubit>().updateQuantity(
                                order["id"],
                                newQty,
                              );
                            },
                          ),
                          const Spacer(),
                          Text(
                            "${order["price"]}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),

                      const Divider(height: 30),
                    ],
                  ),
                );
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
