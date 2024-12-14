import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String id;
  final String name;
  final double price;
  final String description;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
  });

  factory Product.fromDocument(DocumentSnapshot doc) {
    return Product(
      id: doc.id,
      name: doc['name'],
      price: doc['price'].toDouble(),
      description: doc['description'],
      imageUrl: doc['imageUrl'],
    );
  }
}
