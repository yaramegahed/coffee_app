import 'package:coffee_app/features/cart/cubit/order_cubit.dart';
import 'package:coffee_app/features/cart/cubit/order_state.dart';
import 'package:coffee_app/features/checkout/widget/checkout_reset_row.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutInnerContainer extends StatelessWidget {
  const CheckoutInnerContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final userId = user != null
        ? user.uid
        : "guest_123456";
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
      ),
      child: BlocProvider(
        create: (context) => OrdersCubit()..fetchOrders(userId),
        child: BlocBuilder<OrdersCubit, OrdersState>(
          builder: (context, state) {
            if (state is OrdersSuccess) {
              final orders = state.orders;
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// ثابت
                    CheckoutResetRow(
                        title: 'Transaction ID', result: 'V278439380'),
                    CheckoutResetRow(title: 'Date', result: 'Nov 21 2025'),
                    CheckoutResetRow(title: 'Time', result: '03:04 PM'),
                    const SizedBox(height: 10),
                    const DottedLine(),
                    const SizedBox(height: 10),

                    /// هنا هنكرر كل الأوردرز
                    SingleChildScrollView(
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: orders.length,
                        itemBuilder: (context, i) {
                          final order = orders[i];
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                order["productName"],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Spacer(),
                              Text(
                               "\$${order["price"].toString()}",
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (_, __) => const Divider(),
                      ),
                    ),

                    const SizedBox(height: 15),

                    /// Summary
                    const Text(
                      "Payment Summary",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),

                    /// السعر الإجمالي
                    CheckoutResetRow(
                      title: "Total Price",
                      result: "\$${_calculateTotal(orders)}",
                    ),

                    CheckoutResetRow(title: "Reward Points", result: "+ 80"),
                    CheckoutResetRow(
                        title: "Payment Method", result: "Rewards"),
                  ],
                ),
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }

  /// حساب الإجمالي
  String _calculateTotal(List<Map<String, dynamic>> orders) {
    double total = 0;
    for (var o in orders) {
      total += (o["price"] ?? 0);
    }
    return total.toStringAsFixed(2);
  }
}
