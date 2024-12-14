import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String productId;

  const ProductDetailsScreen({required this.productId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy Data - Replace with actual data from Firestore
    final product = {
      'name': 'Sample Product',
      'description': 'This is a great product.',
      'price': 99.99,''
      'imageUrl': 'https://via.placeholder.com/150'
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(product['name'] as String),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product['imageUrl']as String, height: 200),
            const SizedBox(height: 16),
            Text(product['name']as String, style:const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
           const SizedBox(height: 8),
            Text(product['description']as String, style:const TextStyle(fontSize: 16)),
           const SizedBox(height: 16),
            Text('\$${product['price']}', style:const TextStyle(fontSize: 20, color: Colors.green)),
           const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Navigate to the cart or perform add-to-cart logic
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
