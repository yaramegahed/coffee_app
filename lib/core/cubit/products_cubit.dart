import 'package:coffee_app/core/cubit/products_state.dart';
import 'package:coffee_app/core/repos/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



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
