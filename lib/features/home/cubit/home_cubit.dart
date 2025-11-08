import 'package:bloc/bloc.dart';
import 'package:coffee_app/core/repos/product_repo.dart';
import 'package:meta/meta.dart';

import '../../../core/models/products_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final ProductRepo repo=ProductRepo();

  Future<void> getProducts() async {
    emit(HomeLoading());
    try {
      final products = await repo.getProducts();
      emit(HomeSuccess(products: products));
    } catch (e) {
      emit(HomeFailure(message: e.toString()));
    }
  }
}
