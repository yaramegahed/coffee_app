import 'package:coffee_app/core/cubit/products_cubit.dart';
import 'package:coffee_app/core/utils/styles.dart';
import 'package:coffee_app/features/all_product/view/all_product_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/widget/custom_grid_view.dart';
import 'custom_home_order_container.dart';
import '../../../core/widget/custom_menu_categorized_row.dart';
import 'skeleton_screen.dart';

class CustomHomeBody extends StatelessWidget {
  const CustomHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
        if (state is ProductsSuccess) {
          if (kDebugMode) {
            print("Success loading products");
          }
        } else if (state is ProductsFailure) {
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
        if (state is ProductsLoading) {
          return const SkeletonScreen();
        }

        if (state is ProductsSuccess) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 22),
                  Text("Good Morning!", style: Styles.textStyle20b),
                  Text("Login and get free ☕️", style: Styles.textStyle20400),
                  const SizedBox(height: 18),
                  const CustomHomeOrderContainer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomMenuCategorizedRow(
                        menuTitle: state.coffee.first.category??"",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => BlocProvider.value(
                                      value: context.read<ProductsCubit>(),
                                      child: AllProductView(products: state.coffee))));
                        },
                      ),
                      CustomGridView(products: state.coffee, itemCount: state.coffee.take(5).length,),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomMenuCategorizedRow(
                        menuTitle: state.cookie.first.category??"",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => BlocProvider.value(
                                      value: context.read<ProductsCubit>(),
                                      child: AllProductView(products: state.cookie,))));
                        },
                      ),
                      CustomGridView(products: state.cookie, itemCount: state.cookie.take(5).length,),
                      SizedBox(height: 20,),
                    ],
                  ),
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
