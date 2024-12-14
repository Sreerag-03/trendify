import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          leading:
              Image.network(product.imageUrl, fit: BoxFit.cover, width: 50),
          title: Text(product.name),
          subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
          onTap: () {
            Navigator.pushNamed(
              context,
              '/product-details',
              arguments: context // Pass the productId as an argument
            );
          }),
    );
  }
}
