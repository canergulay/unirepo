import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unirepo/core/firebase_manager/models/order_model.dart';
import 'package:unirepo/features/home/data/models/university.dart';

class OrderByController {
  static var shared = OrderByController();
  Order getOrder<T>() {
    return queries[T] ?? _defaultQuery;
  }

  final Map<dynamic, Order> queries = {
    University: Order(field: 'id'),
  };

  final Order _defaultQuery = Order(field: '');
}
