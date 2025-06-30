import 'package:flutter/material.dart';
import 'tambah_diskon.dart';

class DaftarDiskonPage extends StatelessWidget {
  const DaftarDiskonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Diskon', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Column(
          children: [
            // Search Bar
            Container(
              margin: const EdgeInsets.only(bottom: 12.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  hintText: 'Cari Diskon',
                  hintStyle: const TextStyle(color: Colors.grey),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            // Discount List
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(color: Colors.black12),
              ),
              margin: const EdgeInsets.only(bottom: 8.0),
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: const Text('%', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                title: const Text('Lebaran', style: TextStyle(fontWeight: FontWeight.w500)),
                trailing: const Text('20%', style: TextStyle(fontWeight: FontWeight.w500)),
              ),
            ),
            // Add more discount cards here if needed
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TambahDiskonPage()),
          );
        },
        tooltip: 'Tambah Diskon',
        child: const Icon(Icons.add),
      ),
    );
  }
}
