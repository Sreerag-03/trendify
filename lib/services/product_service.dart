import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product_model.dart';

class ProductService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Product>> fetchProducts() async {
    try {
      QuerySnapshot snapshot =
          await _firestore.collection('products').get();

      return snapshot.docs.map((doc) {
        return Product.fromDocument(doc);
      }).toList();
    } catch (e) {
      print('Error fetching products: $e');
      return [];
    }
  }
}
