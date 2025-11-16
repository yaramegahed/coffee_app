import 'package:coffee_app/core/cubit/products_cubit.dart';
import 'package:coffee_app/core/widget/custom_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/cubit/products_state.dart';
import '../../../core/models/products_model.dart';
import '../../../core/widget/custom_menu_categorized_row.dart';

class AllProductBody extends StatelessWidget {
  final List<Product> products;

  const AllProductBody({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
        if (state is ProductsFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        if (state is ProductsLoading) {
          return Center(
              child: const CircularProgressIndicator(
            color: Colors.brown,
          ));
        }

        if (state is ProductsSuccess) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomMenuCategorizedRow(
                        menuTitle: products.first.category??"",
                        show: false,
                      ),
                      CustomGridView(
                        products: products,
                        itemCount: products.length,
                      ),
                      SizedBox(height: 20,)
                    ],
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
