import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:posapp/controller/user_provider.dart';
import 'package:posapp/presentation/pages/pengaturan/main_pengaturan.dart';
import 'package:posapp/presentation/pages/produk/product_management.dart';
import 'package:posapp/presentation/pages/struk/daftar-struk.dart';
import 'package:posapp/presentation/pages/transaksi/pembukuan/pembukuan.dart';
import 'package:posapp/presentation/pages/transaksi/transaksi-lainya/daftar-transaksi-lainnya.dart';
import 'package:posapp/presentation/pages/produk/daftar_produk.dart';
import 'package:posapp/presentation/pages/auth/login_page.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        final currentUser = userProvider.currentUser;
        final isAdmin = userProvider.isAdmin;

        return SizedBox(
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
                        currentUser?.role.toString().split('.').last.toUpperCase() ?? 'User',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        currentUser?.name ?? 'Unknown User',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.shopping_basket_outlined, color: Colors.green),
                  title: const Text('Penjualan'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DaftarProdukPage()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.swap_horiz, color: Colors.green),
                  title: const Text('Transaksi Lainnya'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DaftarTransaksiLainnya()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.receipt_long_outlined, color: Colors.green),
                  title: const Text('Struk Pembayaran'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DaftarStrukPage()));
                  },
                ),
                // Only show Product Management for Admin
                if (isAdmin)
                  ListTile(
                    leading: const Icon(Icons.inventory_2_outlined, color: Colors.green),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductManagementPage()));
                    },
                    title: const Text('Produk'),
                  ),
                // Only show Pembukuan for Admin
                if (isAdmin)
                  ListTile(
                    leading: const Icon(Icons.book_outlined, color: Colors.green),
                    title: const Text('Pembukuan'),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PembukuanPage()));
                    }
                  ),
                // Only show Settings for Admin
                if (isAdmin)
                  ListTile(
                    leading: const Icon(Icons.settings_outlined, color: Colors.green),
                    title: const Text('Pengaturan'),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MainPengaturan()));
                    },
                  ),
                const Spacer(),
                // Logout option
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: const Text('Logout'),
                  onTap: () {
                    userProvider.logout();
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                      (route) => false,
                    );
                  },
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }
}