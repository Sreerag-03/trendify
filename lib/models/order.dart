class Order {
  final String id;
  final DateTime date;
  final double totalAmount;
  final List<Map<String, dynamic>> products;

  Order({
    required this.id,
    required this.date,
    required this.totalAmount,
    required this.products,
  });

  // Instance method: Converts an Order object to a JSON-compatible map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'totalAmount': totalAmount,
      'products': products,
    };
  }

  // Static method: Creates an Order object from a JSON-compatible map
  static Order fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      totalAmount: json['totalAmount'] as double,
      products: List<Map<String, dynamic>>.from(json['products'] as List),
    );
  }
}
