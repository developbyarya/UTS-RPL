import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String name;
  final int price;
  final int stock;
  final String imagePath;

  const ProductItem({
    super.key,
    required this.name,
    required this.price,
    required this.stock,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              Text("Stok: $stock",
                  style: const TextStyle(color: Colors.white70)),
              const SizedBox(height: 4),
              Text("Rp. ${price.toString()}",
                  style: const TextStyle(color: Colors.white)),
            ],
          ),
        )
      ],
    );
  }
}
