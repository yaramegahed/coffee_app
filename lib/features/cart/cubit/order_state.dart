abstract class OrdersState {}

class OrdersInitial extends OrdersState {}

class OrdersLoading extends OrdersState {}

class OrdersSuccess extends OrdersState {
  final List<Map<String, dynamic>> orders;

  OrdersSuccess({required this.orders});
}
class OrdersCountSuccess extends OrdersState {
  final int count;

  OrdersCountSuccess({required this.count});
}

class OrdersFailure extends OrdersState {
  final String message;

  OrdersFailure({required this.message});
}
