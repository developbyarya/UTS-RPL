import 'package:flutter/material.dart';
import 'package:posapp/presentation/pages/produk/tambah_kategori.dart';

class DaftarKategoriProduk extends StatelessWidget {
  const DaftarKategoriProduk({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for categories
    final categories = [
      {'name': 'Sabun', 'count': 2, 'color': Colors.blue},
      {'name': 'Makana Ringan', 'count': 3, 'color': Color(0xFF181A3D)},
      {'name': 'Sabun', 'count': 0, 'color': Color(0xFF5B5BFF)},
      {'name': 'Sabun', 'count': 0, 'color': Color(0xFF00FF85)},
      {'name': 'Sabun', 'count': 0, 'color': Color(0xFF00FF85)},
      {'name': 'Sabun', 'count': 0, 'color': Color(0xFFFF00FF)},
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Kategori', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Cari Kategori',
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                filled: true,
                fillColor: Colors.grey.shade100,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.green),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Category List
            Expanded(
              child: ListView.separated(
                itemCount: categories.length,
                separatorBuilder: (context, index) => SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final cat = categories[index];
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 32,
                          height: 56,
                          decoration: BoxDecoration(
                            color: cat['color'] as Color,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            cat['name'] as String,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Text(
                            '${cat['count']} Produk',
                            style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF22D96B),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TambahKategoriPage()),
          );
        },
        child: Icon(Icons.add, color: Colors.white, size: 32),
      ),
    );
  }
}