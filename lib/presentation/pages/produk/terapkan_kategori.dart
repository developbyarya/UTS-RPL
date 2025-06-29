import 'package:flutter/material.dart';

class TerapkanKategoriPage extends StatefulWidget {
  const TerapkanKategoriPage({super.key});

  @override
  State<TerapkanKategoriPage> createState() => _TerapkanKategoriPageState();
}

class _TerapkanKategoriPageState extends State<TerapkanKategoriPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<bool> _selected = List.generate(6, (index) => false);

  // Dummy product data
  final List<Map<String, dynamic>> _products = List.generate(6, (index) => {
    'name': 'Sabun',
    'price': 'Rp. 3.000',
    'image': 'https://images.tokopedia.net/img/cache/700/VqbcmM/2022/12/7/7e2e4b2e-7e2e-4e2e-8e2e-7e2e4b2e7e2e.jpg',
    'color': Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Terapkan Kategori', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0.5,
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
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Cari Produk',
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
            // Product List
            Expanded(
              child: ListView.separated(
                itemCount: _products.length,
                separatorBuilder: (context, index) => SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final product = _products[index];
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                          child: Image.network(
                            product['image'],
                            width: 56,
                            height: 56,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product['name'],
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  product['price'],
                                  style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 20,
                          height: 56,
                          decoration: BoxDecoration(
                            color: product['color'],
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                            ),
                          ),
                        ),
                        Checkbox(
                          value: _selected[index],
                          onChanged: (val) {
                            setState(() {
                              _selected[index] = val ?? false;
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF22D96B),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text(
                  'Simpan',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
