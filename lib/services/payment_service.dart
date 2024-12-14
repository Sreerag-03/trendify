import 'package:url_launcher/url_launcher.dart';

class PaymentService {
  static Future<void> initiateGooglePay({
    required String upiId,
    required String name,
    required double amount,
  }) async {
    // Construct the UPI Intent URL
    final uri = Uri.parse(
      'upi://pay?pa=$upiId&pn=$name&am=$amount&cu=INR&tn=E-commerce%20Payment',
    );

    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        throw "Could not launch UPI intent";
      }
    } catch (e) {
      throw "Payment initiation failed: $e";
    }
  }
}
