import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trendify/models/order.dart';
import 'package:trendify/providers/order_provider.dart';

class OrderHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);
    final userId = "currentUserUID"; // Replace with the actual authenticated user's ID

    return Scaffold(
      appBar: AppBar(title: const Text("Order History")),
      body: FutureBuilder<List<Order>>(
        future: orderProvider.fetchOrders(userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No orders found."));
          } else {
            final orders = snapshot.data!;
            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return ListTile(
                  title: Text("Order ID: ${order.id}"),
                  subtitle: Text("Total: ₹${order.totalAmount}"),
                  trailing: Text(order.date.toString().split(' ')[0]),
                );
              },
            );
          }
        },
      ),
    );
  }
}
