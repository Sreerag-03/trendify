import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trendify/models/order.dart' as app_order; // Alias for your custom Order class


class OrderProvider with ChangeNotifier {
  final _firestore = FirebaseFirestore.instance;

  Future<void> saveOrder(String userId, app_order.Order order) async {
    try {
      // Use the instance method toJson() for serialization
      await _firestore
          .collection('orders')
          .doc(userId)
          .collection('userOrders')
          .add(order.toJson());
    } catch (e) {
      throw "Error saving order: $e";
    }
  }

  Future<List<app_order.Order>> fetchOrders(String userId) async {
    try {
      final snapshot = await _firestore
          .collection('orders')
          .doc(userId)
          .collection('userOrders')
          .get();

      // Use the static method fromJson() for deserialization
      return snapshot.docs
          .map((doc) => app_order.Order.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw "Error fetching orders: $e";
    }
  }
}
