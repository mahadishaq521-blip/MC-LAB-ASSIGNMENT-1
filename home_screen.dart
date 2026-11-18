import 'package:flutter/material.dart';
import '../main.dart';
import 'product_details_screen.dart';
import 'add_product_screen.dart';
import 'gestures_animation_screen.dart';
import 'counter_screen.dart';
import 'webview_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _refreshHome() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuickShop Home'),
        backgroundColor: const Color(0xFF1E1E1E),
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF2C2C2C)),
              accountName: Text('Muhammad Mahad', style: TextStyle(fontWeight: FontWeight.bold)),
              accountEmail: Text('bsit@air.edu.pk'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.tealAccent,
                child: Text('MM', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.tealAccent),
              title: const Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.add_box, color: Colors.tealAccent),
              title: const Text('Add Product'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddProductScreen()),
                ).then((_) => _refreshHome());
              },
            ),
            ListTile(
              leading: const Icon(Icons.touch_app, color: Colors.tealAccent),
              title: const Text('Gestures & Animations'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GesturesAnimationScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.calculate, color: Colors.tealAccent),
              title: const Text('Counter State Management'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CounterScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.web, color: Colors.tealAccent),
              title: const Text('WebView Integration'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WebViewScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: globalProducts.isEmpty
          ? Center(
              child: Text(
                'No products available. Add one from the menu!',
                style: TextStyle(color: Colors.grey[400], fontSize: 16),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                itemCount: globalProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  final product = globalProducts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsScreen(product: product),
                        ),
                      ).then((_) => _refreshHome());
                    },
                    onDoubleTap: () {
                      setState(() {
                        product.isFavorite = !product.isFavorite;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            product.isFavorite
                                ? '\${product.name} added to favorites!'
                                : '\${product.name} removed from favorites.',
                          ),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text(product.name),
                          content: Text('Price: \\$\${product.price.toStringAsFixed(2)}\n\nQuick Action: Long press detected!'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(ctx),
                              child: const Text('Close'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.network(
                                  product.imageUrl,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) => Container(
                                    color: Colors.grey[800],
                                    child: const Icon(Icons.image_not_supported, size: 40),
                                  ),
                                ),
                                if (product.isFavorite)
                                  const Positioned(
                                    top: 8,
                                    right: 8,
                                    child: Icon(Icons.favorite, color: Colors.redAccent),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '\\$\${product.price.toStringAsFixed(2)}',
                                  style: const TextStyle(color: Colors.tealAccent, fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddProductScreen()),
          ).then((_) => _refreshHome());
        },
        backgroundColor: Colors.tealAccent,
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
