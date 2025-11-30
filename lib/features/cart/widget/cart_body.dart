import 'package:coffee_app/core/constants/app_colors.dart';
import 'package:coffee_app/features/cart/cubit/order_cubit.dart';
import 'package:coffee_app/features/cart/widget/empty_cart.dart';
import 'package:coffee_app/features/checkout/view/checkout_view.dart';
import 'package:coffee_app/features/home/widget/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../cubit/order_state.dart';
import 'cart_item_card.dart';
import 'delivery_options.dart';

class CartBody extends StatefulWidget {
  const CartBody({
    super.key,
    required this.userId,
  });

  final String userId;

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OrdersCubit()..fetchOrders(widget.userId),
      child: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          if (state is OrdersLoading) {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.brownButtonColor,
            ));
          }

          if (state is OrdersSuccess) {
            final orders = state.orders;

            if (orders.isEmpty) return const EmptyCart();

            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      itemCount: orders.length,
                      itemBuilder: (_, i) {
                        final order = orders[i];
                        return Slidable(
                          key: Key(order["id"]),
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            extentRatio: 0.3,
                            children: [
                              SlidableAction(
                                onPressed: (_) {
                                  context.read<OrdersCubit>().removeOrder(
                                        order["id"],
                                      );
                                },
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                            ],
                          ),
                          child: CartItemCard(
                            order: order,
                            onQtyChanged: (qty) {
                              context
                                  .read<OrdersCubit>()
                                  .updateQuantity(order["id"], qty);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  DeliveryOptions(
                    selectedOption: selectedOption,
                    onChanged: (val) => setState(() => selectedOption = val),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CustomButton(
                      title: "CheckOut",
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => CheckoutView(),
                            ));
                      },
                      width: double.infinity,
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
