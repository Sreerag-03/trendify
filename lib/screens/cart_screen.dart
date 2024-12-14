import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trendify/providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Your Cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, index) {
                final cartItem = cart.items.values.toList()[index];
                return ListTile(
                  title: Text(cartItem.name),
                  subtitle: Text('Quantity: ${cartItem.quantity}'),
                  trailing: Text('\$${cartItem.price * cartItem.quantity}'),
                );
              },
            ),
          ),
          Divider(),
          Text('Total: \$${cart.totalAmount.toStringAsFixed(2)}'),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              cart.clearCart();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Order Placed!')),
              );
            },
            child: Text('Place Order'),
          ),
        ],
      ),
    );
  }
}
