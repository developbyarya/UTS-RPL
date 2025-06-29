import 'package:flutter/material.dart';
import 'package:posapp/presentation/pages/produk/terapkan_kategori.dart';

class TambahKategoriPage extends StatefulWidget {
  const TambahKategoriPage({super.key});

  @override
  State<TambahKategoriPage> createState() => _TambahKategoriPageState();
}

class _TambahKategoriPageState extends State<TambahKategoriPage> {
  final TextEditingController _namaController = TextEditingController();
  int? _selectedColorIndex;

  final List<Color> _colors = [
    Color(0xFFFF0000), // Red
    Color(0xFF6BFF3A), // Green
    Color(0xFFF7DADA), // Light Pink
    Color(0xFF000000), // Black
    Color(0xFF6B3AFF), // Purple
    Color(0xFFFF3AD6), // Pink
    Color(0xFF3AFFC8), // Aqua
    Color(0xFFC85A5A), // Brownish
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Tambah Kategori', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              const Text('Nama Kategori', style: TextStyle(fontSize: 14, color: Colors.grey)),
              const SizedBox(height: 8),
              TextField(
                controller: _namaController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              const Text('Warna Kategori', style: TextStyle(fontSize: 14, color: Colors.grey)),
              const SizedBox(height: 12),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1,
                ),
                itemCount: _colors.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedColorIndex = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: _colors[index],
                        borderRadius: BorderRadius.circular(8),
                        border: _selectedColorIndex == index
                            ? Border.all(color: Colors.green, width: 3)
                            : null,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 32),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TerapkanKategoriPage()),
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Color(0xFF22D96B)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  minimumSize: Size(double.infinity, 48),
                ),
                child: const Text(
                  'Terapkan pada produk',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Color(0xFF22D96B)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  minimumSize: Size(double.infinity, 48),
                ),
                child: const Text(
                  'Buat produk',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
        child: SizedBox(
          width: double.infinity,
          height: 52,
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
      ),
    );
  }
}
