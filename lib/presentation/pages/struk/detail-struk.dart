import 'package:flutter/material.dart';

class DetailStrukPage extends StatelessWidget {
  const DetailStrukPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('#2-1009', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 24),
          const Text(
            'Rp 5.000',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            'Total harga',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 16),
          const Divider(thickness: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                _ProductItem(
                  imageUrl: 'https://images.tokopedia.net/img/cache/700/VqbcmM/2022/12/6/7e2e2e2e-7e2e-4e2e-8e2e-7e2e2e2e2e2e.jpg',
                  name: 'Oreo',
                  qty: 1,
                  price: 3000,
                ),
                _ProductItem(
                  imageUrl: 'https://images.tokopedia.net/img/cache/700/VqbcmM/2022/12/6/7e2e2e2e-7e2e-4e2e-8e2e-7e2e2e2e2e2e.jpg',
                  name: 'Snickers',
                  qty: 1,
                  price: 2000,
                ),
              ],
            ),
          ),
          const Divider(thickness: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Total', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text('Rp. 5000', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Cash', style: TextStyle(fontSize: 16)),
                    Text('Rp. 5000', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('20/04/2025 10.34', style: TextStyle(color: Colors.black38)),
                Text('#2-1009', style: TextStyle(color: Colors.black38)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int qty;
  final int price;

  const _ProductItem({
    required this.imageUrl,
    required this.name,
    required this.qty,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 56,
              height: 56,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text('Jumlah: $qty', style: const TextStyle(fontSize: 14)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Rp. ${price.toString().replaceAllMapped(RegExp(r"(\d{1,3})(?=(\d{3})+(?!\d))"), (Match m) => "${m[1]}.")}', style: const TextStyle(fontSize: 13, color: Colors.black54)),
              Text('Total: Rp. ${(price * qty).toString().replaceAllMapped(RegExp(r"(\d{1,3})(?=(\d{3})+(?!\d))"), (Match m) => "${m[1]}.")}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            ],
          ),
        ],
      ),
    );
  }
}
