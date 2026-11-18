import 'package:flutter/material.dart';
import 'models/product.dart';
import 'screens/splash_screen.dart';

List<Product> globalProducts = [
  Product(
    name: 'Wireless Headphones',
    price: 59.99,
    description: 'High-fidelity active noise-canceling wireless headphones with 30-hour battery life and deep bass.',
    imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500&auto=format&fit=crop&q=60',
  ),
  Product(
    name: 'Smart Watch Series X',
    price: 129.99,
    description: 'Advanced fitness tracker, heart rate monitor, GPS, and waterproof AMOLED display.',
    imageUrl: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500&auto=format&fit=crop&q=60',
  ),
  Product(
    name: 'Minimalist Backpack',
    price: 45.00,
    description: 'Water-resistant daily commuter backpack with dedicated laptop compartment and ergonomic straps.',
    imageUrl: 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=500&auto=format&fit=crop&q=60',
  ),
];

void main() {
  runApp(const QuickShopApp());
}

class QuickShopApp extends StatelessWidget {
  const QuickShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuickShop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFF121212),
        cardColor: const Color(0xFF1E1E1E),
        colorScheme: ColorScheme.dark(
          primary: Colors.deepPurpleAccent,
          secondary: Colors.tealAccent,
          surface: const Color(0xFF1E1E1E),
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
