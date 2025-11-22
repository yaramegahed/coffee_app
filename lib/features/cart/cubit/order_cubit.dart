import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'order_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());

  final _ordersCollection = FirebaseFirestore.instance.collection('orders');

  Future<void> fetchOrders(String userId) async {
    emit(OrdersLoading());
    try {
      final snapshot =
          await _ordersCollection.where('userId', isEqualTo: userId).get();

      final orders = snapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return data;
      }).toList();

      emit(OrdersSuccess(orders: orders));
    } catch (e) {
      emit(OrdersFailure(message: e.toString()));
    }
  }

  Future<void> addOrder(Map<String, dynamic> orderData) async {
    try {
      final newDoc = await _ordersCollection.add(orderData);
      orderData['id'] = newDoc.id;

      if (state is OrdersSuccess) {
        final updated = List<Map<String, dynamic>>.from(
          (state as OrdersSuccess).orders,
        );
        updated.add(orderData);

        emit(OrdersSuccess(orders: updated));
      }
    } catch (e) {
      emit(OrdersFailure(message: e.toString()));
    }
  }

  Future<void> updateQuantity(String orderId, int quantity) async {
    try {
      await _ordersCollection.doc(orderId).update({'quantity': quantity});

      if (state is OrdersSuccess) {
        final updated = (state as OrdersSuccess).orders.map((order) {
          if (order['id'] == orderId) {
            return {...order, 'quantity': quantity};
          }
          return order;
        }).toList();

        emit(OrdersSuccess(orders: updated));
      }
    } catch (e) {
      emit(OrdersFailure(message: e.toString()));
    }
  }

  Future<void> removeOrder(String orderId) async {
    try {
      await _ordersCollection.doc(orderId).delete();

      if (state is OrdersSuccess) {
        final updated = (state as OrdersSuccess)
            .orders
            .where((order) => order['id'] != orderId)
            .toList();

        emit(OrdersSuccess(orders: updated));
      }
    } catch (e) {
      emit(OrdersFailure(message: e.toString()));
    }
  }

  void listenOrdersCount(String userId) {
    _ordersCollection
        .where('userId', isEqualTo: userId)
        .snapshots()
        .listen((snapshot) {
      emit(OrdersCountSuccess(count: snapshot.docs.length));
    });
  }
}
