import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unirepo/core/firebase_manager/models/order_model.dart';
import 'package:unirepo/features/home/data/models/university.dart';

mixin OrderMixin<T> {
  Order getOrder() {
    return queries[T] ?? _defaultQuery;
  }

  Map<dynamic, Order> queries = {
    University: Order(field: 'id'),
  };

  final Order _defaultQuery = Order(field: '');
}
