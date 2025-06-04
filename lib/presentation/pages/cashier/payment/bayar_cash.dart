import 'package:flutter/material.dart';
import 'package:posapp/presentation/pages/cashier/payment/payment_done.dart';

class CashConfirmationPage extends StatelessWidget {
  final int totalHarga;
  final int uangDiterima;

  const CashConfirmationPage({super.key, required this.totalHarga, required this.uangDiterima});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cash'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          }, // Tidak ada aksi navigasi
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 50),
          Column(
            children: [
              Text(
                'Rp ${totalHarga.toString()}',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Total harga',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              Text(
                'Uang diterima: Rp ${uangDiterima.toString()}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              Text(
                'Kembalian: Rp ${uangDiterima - totalHarga}',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SuccessPage()));
                }, // Tidak ada aksi
                icon: Icon(Icons.check, color: Colors.white),
                label: Text(
                  'Penjualan Baru',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
