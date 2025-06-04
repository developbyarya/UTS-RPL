import 'package:flutter/material.dart';
import 'package:posapp/model/ItemModel.dart';
import 'package:posapp/model/itemCartModel.dart';
import 'package:posapp/presentation/components/product/product_item.dart';
import 'package:posapp/presentation/components/reuseable/sidebar.dart';
import 'package:posapp/presentation/pages/cashier/konfirmasi.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final List<ItemModel> dummyProducts =[
    ItemModel(
      id: "1",
      name: "Oreo",
      price: 3000,
      stock: 20,
      imagePath: "assets/dummy_product_image/oreo.png",
    ),
    ItemModel(
      id: "2",
      name: "Snickers",
      price: 2000,
      stock: 20,
      imagePath: "assets/dummy_product_image/snickers.png",
    ),   
    // tambahkan item lainnya
  ];

  final List<ItemCartModel> cartItems = [];

  int totalPrice = 0;

  void addToCart(ItemModel product) {
    if (cartItems.any((item) => item.id == product.id)) {
        cartItems.firstWhere((item) => item.id == product.id).quantity++;
      } else {
        cartItems.add(ItemCartModel(
          id: product.id,
          name: product.name,
          imagePath: product.imagePath,
          price: product.price,
          stock: product.stock,
          quantity: 1
        ));
      }
    setState(() {
      
      totalPrice += product.price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu, color: Colors.black),
            );
          }
        ),
        title:
            const Text('Daftar Produk', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      drawer: Sidebar(),
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
                  return InkWell(
                    onTap: () {
                      addToCart(product);
                    },
                    child: ProductItem(
                      name: product.name,
                      price: product.price,
                      stock: product.stock,
                      imagePath: product.imagePath,
                    ),
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
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => KonfirmasiPage(cartItems: cartItems)));
          },
          icon: const Icon(Icons.shopping_cart, color: Colors.white),
          label: Text("Rp $totalPrice", style: const TextStyle(fontSize: 16, color: Colors.white)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
          
      //   },
      //   child: Icon(Icons.shopping_cart),
      // ),
    );
  }
}
