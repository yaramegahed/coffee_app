import 'package:coffee_app/core/utils/styles.dart';
import 'package:coffee_app/features/home/cubit/home_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_home_order_container.dart';
import '../../../core/widget/custom_menu_categorized_row.dart';
import '../../../core/widget/custom_menu_items.dart';
import 'skeleton_screen.dart';

class CustomHomeBody extends StatelessWidget {
  const CustomHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeSuccess) {
          if (kDebugMode) {
            print("✅ Success loading products!");
          }
        } else if (state is HomeFailure) {
          if (kDebugMode) {
            print(state.message);
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.message,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is HomeLoading) {
          return const SkeletonScreen();
        }

        if (state is HomeSuccess) {
          final products = state.products;
          final categories = products.map((p) => p.category).toSet();

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 22),

                  // Greeting
                  Text("Good Morning!", style: Styles.textStyle20b),
                  Text("Login and get free ☕️", style: Styles.textStyle20400),

                  const SizedBox(height: 18),

                  const CustomHomeOrderContainer(),

                  ...categories.map((category) {
                    final categoryProducts =
                        products.where((p) => p.category == category).toList();
                    final limitedProducts = categoryProducts.take(5).toList();

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomMenuCategorizedRow(
                          menuTitle: category ?? "",
                          onPressed: () {},
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: limitedProducts.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.7,
                          ),
                          itemBuilder: (context, index) {
                            final product = categoryProducts[index];
                            return CustomMenuItems(
                              itemTitle: product.name ?? "",
                              itemImage: product.imageUrl,
                            );
                          },
                        ),
                        const SizedBox(height: 30),
                      ],
                    );
                  }),
                ],
              ),
            ),
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
