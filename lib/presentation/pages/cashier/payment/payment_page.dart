import 'package:flutter/material.dart';
import 'package:posapp/presentation/pages/cashier/payment/bayar_cash.dart';
import 'package:posapp/presentation/pages/cashier/home/daftar_produk.dart';
class MetodePembayaranPage extends StatefulWidget {
  final int totalHarga;

  const MetodePembayaranPage({super.key, required this.totalHarga});

  @override
  State<MetodePembayaranPage> createState() => _MetodePembayaranPageState();
}

class _MetodePembayaranPageState extends State<MetodePembayaranPage> {
  TextEditingController uangDiterimaController = TextEditingController();
  bool isValidAmount = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Metode Pembayaran'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          }, // No back functionality needed
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 24),
            Text(
              'Rp ${widget.totalHarga}',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Total harga',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 32),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Uang Diterima',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: uangDiterimaController,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.isEmpty) {
                  setState(() {
                    isValidAmount = false;
                  });
                  return;
                }
                try {
                  int amount = int.parse(value);
                  setState(() {
                    isValidAmount = amount >= widget.totalHarga;
                  });
                } catch (e) {
                  setState(() {
                    isValidAmount = false;
                  });
                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                errorText: !isValidAmount && uangDiterimaController.text.isNotEmpty
                    ? 'Jumlah harus lebih besar atau sama dengan total harga'
                    : null,
              ),
            ),
            SizedBox(height: 32),
            PaymentButton(
              label: 'CASH',
              icon: Icons.attach_money,
              onTap: !isValidAmount
                  ? null
                  : () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CashConfirmationPage(
                                  totalHarga: widget.totalHarga,
                                  uangDiterima:
                                      int.parse(uangDiterimaController.text))));
                    },
            ),
            SizedBox(height: 16),
            PaymentButton(
              label: 'CARD',
              icon: Icons.credit_card,
              onTap: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => ProductListPage()), (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback? onTap;

  const PaymentButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.green),
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      icon: Icon(icon, color: Colors.black),
      label: Text(
        label,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
