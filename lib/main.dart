import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:posapp/controller/user_provider.dart';
import 'package:posapp/presentation/pages/auth/login_page.dart';
import 'package:posapp/presentation/pages/cashier/home/daftar_produk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        title: 'Kinandaru POS',
        theme: ThemeData(
          primarySwatch: Colors.green,
          useMaterial3: true,
        ),
        home: Consumer<UserProvider>(
          builder: (context, userProvider, child) {
            if (userProvider.isLoggedIn) {
              return const ProductListPage();
            } else {
              return const LoginPage();
            }
          },
        ),
      ),
    );
  }
}