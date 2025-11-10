part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsSuccess extends ProductsState {
  final List<Product> coffee;
  final List<Product> cookie;

  ProductsSuccess({required this.cookie, required this.coffee});
}

class ProductsFailure extends ProductsState {
  final String message;

  ProductsFailure({required this.message});
}
