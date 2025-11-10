import 'package:bloc/bloc.dart';
import 'package:coffee_app/core/repos/product_repo.dart';
import 'package:meta/meta.dart';

import '../../../core/models/products_model.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  final ProductRepo repo = ProductRepo();

  Future<void> getProducts() async {
    emit(ProductsLoading());
    try {
      final products = await repo.getProducts(category: "coffee");
      final cookies = await repo.getProducts(category: "cookie");
      emit(ProductsSuccess(coffee: products, cookie: cookies));
    } catch (e) {
      emit(ProductsFailure(message: e.toString()));
    }
  }
}
