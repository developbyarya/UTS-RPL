import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Drawer(
        child: Column(
          children: [
            Container(
              color: Colors.green,
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pemilik',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Joko utomo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.shopping_basket_outlined, color: Colors.green),
              title: Text('Penjualan'),
            ),
            ListTile(
              leading: Icon(Icons.swap_horiz, color: Colors.green),
              title: Text('Transaksi Lainnya'),
            ),
            ListTile(
              leading: Icon(Icons.receipt_long_outlined, color: Colors.green),
              title: Text('Struk Pembayaran'),
            ),
            ListTile(
              leading: Icon(Icons.inventory_2_outlined, color: Colors.green),
              title: Text('Produk'),
            ),
            ListTile(
              leading: Icon(Icons.book_outlined, color: Colors.green),
              title: Text('Pembukuan'),
            ),
            ListTile(
              leading: Icon(Icons.settings_outlined, color: Colors.green),
              title: Text('Pengaturan'),
            ),
            ListTile(
              leading: Icon(Icons.android_outlined, color: Colors.green),
              title: Text('Apps'),
            ),
            ListTile(
              leading: Icon(Icons.help_outline, color: Colors.green),
              title: Text('Bantuan'),
            ),
          ],
        ),
      ),
    );
  }
}