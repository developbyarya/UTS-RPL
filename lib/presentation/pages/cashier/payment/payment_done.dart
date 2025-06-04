import 'package:flutter/material.dart';
import 'package:posapp/presentation/pages/cashier/home/daftar_produk.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              size: 100,
              color: Colors.green,
            ),
            SizedBox(height: 16),
            Text(
              'Sukses',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: OutlinedButton.icon(
                onPressed: () {}, // Tambahkan fungsi cetak struk
                icon: Icon(Icons.print),
                label: Text('Cetak Struk'),
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(double.infinity, 48),
                  side: BorderSide(color: Colors.black),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => ProductListPage()), (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 48),
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  foregroundColor: Colors.white,
                ), // Tambahkan fungsi kembali
                child: Text('Kembali ke Halaman Utama'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
