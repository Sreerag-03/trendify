import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trendify/providers/cart_provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String productId;

  const ProductDetailsScreen({required this.productId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Replace with Firestore product fetch logic
    final product = {
      'id': productId,
      'name': 'Sample Product',
      'price': 1.1,
      'description': 'This is a detailed description.',
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(product['name'] as String),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Replace Image and description widgets as needed
          SizedBox(height: 16),
          Text('Price: \$${product['price']}'),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              Provider.of<CartProvider>(context, listen: false).addItem(
                product['id'] as String,
                product['name'] as String,
                product['price'] as double,
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Added to Cart!')),
              );
            },
            child: Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}

