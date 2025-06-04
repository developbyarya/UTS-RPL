import 'package:flutter/material.dart';
import 'package:posapp/presentation/pages/cashier/home/daftar_produk.dart';
import 'package:posapp/presentation/pages/cashier/konfirmasi.dart';
import 'package:posapp/presentation/pages/cashier/payment/bayar_cash.dart';
import 'package:posapp/presentation/pages/cashier/payment/payment_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ProductListPage(),
    );
  }
}