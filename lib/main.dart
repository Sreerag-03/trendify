import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trendify/firebase_options.dart';
import 'package:trendify/providers/cart_provider.dart';
import 'package:trendify/screens/home_screen.dart';
import 'package:trendify/screens/login_screen.dart';
import 'package:trendify/screens/orders/confirmation_screen.dart';
import 'package:trendify/screens/orders/order_history_screen.dart';
import 'package:trendify/screens/product_detail_screen.dart';
import 'package:trendify/screens/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/product-details': (context) =>
            const ProductDetailsScreen(productId: ''),
        '/orderHistory': (ctx) => OrderHistoryScreen(),
        '/orderConfirmation': (ctx) => ConfirmationScreen(orderId: ''),
      },
    );
  }
}
