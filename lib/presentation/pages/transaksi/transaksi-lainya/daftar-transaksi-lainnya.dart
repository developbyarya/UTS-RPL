import 'package:flutter/material.dart';
import 'package:posapp/presentation/components/reuseable/sidebar.dart';
import 'tambah-transaksi-lainnya.dart';

class DaftarTransaksiLainnya extends StatefulWidget {
  const DaftarTransaksiLainnya({Key? key}) : super(key: key);

  @override
  State<DaftarTransaksiLainnya> createState() => _DaftarTransaksiLainnyaState();
}

class _DaftarTransaksiLainnyaState extends State<DaftarTransaksiLainnya> {
  final TextEditingController _searchController = TextEditingController();

  // Dummy data for transactions
  final List<Map<String, String>> _transactions = [
    {
      'name': 'Transaksi A',
      'time': '10:34 AM',
      'code': '#2-1009',
    },
    {
      'name': 'Transaksi A',
      'time': '10:34 AM',
      'code': '#2-1009',
    },
    {
      'name': 'Transaksi A',
      'time': '10:34 AM',
      'code': '#2-1009',
    },
  ];

  List<Map<String, String>> get _filteredTransactions {
    final query = _searchController.text.toLowerCase();
    if (query.isEmpty) return _transactions;
    return _transactions
        .where((tx) => tx['name']!.toLowerCase().contains(query) || tx['code']!.toLowerCase().contains(query))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    // Use a static date string for now
    final formattedDate = 'Minggu, 20 April 2025';
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const Sidebar(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Transaksi Lainnya', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(Icons.search, color: Colors.grey),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      onChanged: (_) => setState(() {}),
                      decoration: const InputDecoration(
                        hintText: 'Cari Transaksi Lainnya',
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Text(
              formattedDate,
              style: const TextStyle(color: Color(0xFF22D96B), fontSize: 13),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: _filteredTransactions.length,
              itemBuilder: (context, index) {
                final tx = _filteredTransactions[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    title: Text(
                      tx['name']!,
                      style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Color(0xFF181A3D)),
                    ),
                    subtitle: Text(
                      tx['time']!,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    trailing: Text(
                      tx['code']!,
                      style: const TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF22D96B),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TambahTransaksiLainnya()),
          );
        },
        child: const Icon(Icons.add, size: 32, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
