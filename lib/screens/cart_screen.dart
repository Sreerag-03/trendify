import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trendify/providers/cart_provider.dart';
import 'package:trendify/screens/orders/order_history_screen.dart';
import 'package:trendify/services/payment_service.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final totalAmount = cart.totalAmount;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => OrderHistoryScreen()),
                );
              },
              icon: const Icon(Icons.history))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) {
                final item = cart.items.values.toList()[i];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text("Quantity: ${item.quantity}"),
                  trailing: Text("₹${item.price * item.quantity}"),
                );
              },
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "₹$totalAmount",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                await PaymentService.initiateGooglePay(
                  upiId:
                      "bahirgondeshubham-1@okhdfcbank", // Replace with your merchant UPI ID
                  name: "Shubham",
                  amount: totalAmount,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Payment initiated!")),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Payment failed: $e")),
                );
              }
            },
            child: const Text("Proceed to Pay"),
          ),
        ],
      ),
    );
  }
}
