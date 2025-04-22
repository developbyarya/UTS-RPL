import 'package:flutter/material.dart';
import 'package:posapp/presentation/components/product/product_item.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({Key? key}) : super(key: key);

  final dummyProducts = const [
    {
      "name": "Oreo",
      "price": 3000,
      "stock": 20,
      "image": "assets/images/oreo.jpg",
    },
    {
      "name": "Snickers",
      "price": 2000,
      "stock": 20,
      "image": "assets/images/snickers.jpg",
    },
    {
      "name": "Lays",
      "price": 3000,
      "stock": 20,
      "image": "assets/images/lays.jpg",
    },
    // tambahkan item lainnya
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.menu, color: Colors.black),
        title:
            const Text('Daftar Produk', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: 'Cari Produk',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Grid produk
            Expanded(
              child: GridView.builder(
                itemCount: dummyProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  final product = dummyProducts[index];
                  return ProductItem(
                    name: product['name'] as String,
                    price: product['price'] as int,
                    stock: product['stock'] as int,
                    imagePath: product['image'] as String,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.shopping_cart, color: Colors.white),
          label: const Text("Rp 5000", style: TextStyle(fontSize: 16)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
