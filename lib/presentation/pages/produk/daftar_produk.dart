import 'package:flutter/material.dart';
import 'package:posapp/presentation/pages/produk/edit_produk.dart';
import 'package:posapp/presentation/pages/produk/tambah_page.dart';
import '../../../domain/model/item_model.dart';

class DaftarProdukPage extends StatefulWidget {
  const DaftarProdukPage({super.key});

  @override
  State<DaftarProdukPage> createState() => _DaftarProdukPageState();
}

class _DaftarProdukPageState extends State<DaftarProdukPage> {
  final List<ItemModel> _items = [
    ItemModel(
      id: '1',
      name: 'Sabun',
      price: 3000,
      imageUrl: 'assets/dummy_product_image/oreo.png',
      discount: 0,
      sourceName: "Toko A",
      purchasePrice: 2000,
      stock: 10,
      barcode: "1234567890",
    ),
    ItemModel(
      id: '2',
      name: 'Shampoo',
      price: 3000,
      imageUrl: 'assets/dummy_product_image/oreo.png',
      discount: 0,
      sourceName: "Toko A",
      purchasePrice: 2000,
      stock: 10,
      barcode: "1234567890",
    ),
    ItemModel(
      id: '3',
      name: 'Pasta Gigi',
      price: 3000,
      imageUrl: 'assets/dummy_product_image/oreo.png',
      discount: 0,
      sourceName: "Toko A",
      purchasePrice: 2000,
      stock: 10,
      barcode: "1234567890",
    ),
   
  ];

  List<ItemModel> _filteredItems = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredItems = _items;
    _searchController.addListener(_filterItems);
  }

  void _filterItems() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredItems = _items.where((item) => 
        item.name.toLowerCase().contains(query)
      ).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produk'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Cari Produk',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: _filteredItems.length,
              itemBuilder: (context, index) {
                final item = _filteredItems[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EditProdukPage(item: item)));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          // Product Image
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: AssetImage(item.imageUrl ?? 'assets/dummy_product_image/oreo.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          // Product Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'Rp. ${item.price.toStringAsFixed(0)}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Right colored indicator
                          Container(
                            width: 8,
                            height: 60,
                            decoration: BoxDecoration(
                              color: index % 2 == 0 ? Colors.blue : Colors.green,
                              borderRadius: const BorderRadius.horizontal(
                                right: Radius.circular(4),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => TambahProdukPage()));
        },
        backgroundColor: Colors.green,
        
        child: const Icon(Icons.add, color: Colors.white,),
      ),
    );
  }
}