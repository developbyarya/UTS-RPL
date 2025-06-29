import 'package:flutter/material.dart';
import 'package:posapp/presentation/pages/produk/daftar_produk.dart';
import 'package:posapp/presentation/pages/produk/kategori_produk.dart';
class ProductManagementPage extends StatelessWidget {
  const ProductManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produk'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          children: [
            _buildMenuCard(
              icon: Icons.list,
              label: 'Produk',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DaftarProdukPage()),
                );
              },
              color: Colors.green,
            ),
            _buildMenuCard(
              icon: Icons.category,
              label: 'Kategori',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DaftarKategoriProduk()),
                );
              },
              color: Colors.green,
            ),
            _buildMenuCard(
              icon: Icons.extension,
              label: 'Pengubah',
              onTap: () {
                // TODO: Navigate to modifiers page
              },
              color: Colors.green,
            ),
            _buildMenuCard(
              icon: Icons.local_offer,
              label: 'Diskon',
              onTap: () {
                // TODO: Navigate to discounts page
              },
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required Color color,
  }) {
    return Card(
      color: color,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48,
              color: Colors.white,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
