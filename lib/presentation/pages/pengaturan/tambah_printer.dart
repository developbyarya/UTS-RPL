import 'package:flutter/material.dart';

class TambahPrinter extends StatefulWidget {
  const TambahPrinter({Key? key}) : super(key: key);

  @override
  State<TambahPrinter> createState() => _TambahPrinterState();
}

class _TambahPrinterState extends State<TambahPrinter> {
  final TextEditingController _namaPrinterController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  final List<String> _allModels = ['Model A', 'Model B', 'Model C', 'Model D'];
  List<String> _filteredModels = [];
  final Set<String> _selectedModels = {};
  bool _cetakStruk1 = true;
  bool _cetakStruk2 = false;

  @override
  void initState() {
    super.initState();
    _filteredModels = List.from(_allModels);
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    setState(() {
      _filteredModels = _allModels
          .where((model) => model.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  void dispose() {
    _namaPrinterController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Tambah Printer',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0.5,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Nama Printer',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _namaPrinterController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFF22C55E)),
                ),
                hintText: '',
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'Model Printer',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
            const SizedBox(height: 8),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 0.5,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Column(
                  children: [
                    TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search, size: 22),
                        hintText: 'Cari',
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                    SizedBox(
                      height: 120,
                      child: ListView(
                        children: _filteredModels.map((model) {
                          return CheckboxListTile(
                            value: _selectedModels.contains(model),
                            onChanged: (val) {
                              setState(() {
                                if (val == true) {
                                  _selectedModels.add(model);
                                } else {
                                  _selectedModels.remove(model);
                                }
                              });
                            },
                            title: Text(model),
                            controlAffinity: ListTileControlAffinity.leading,
                            dense: true,
                            contentPadding: EdgeInsets.zero,
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 0.5,
              child: SwitchListTile(
                value: _cetakStruk1,
                onChanged: (val) => setState(() => _cetakStruk1 = val),
                title: const Text('Cetak Struk'),
                activeColor: Color(0xFF8B5CF6),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 0.5,
              child: SwitchListTile(
                value: _cetakStruk2,
                onChanged: (val) => setState(() => _cetakStruk2 = val),
                title: const Text('Cetak Struk'),
                activeColor: Color(0xFF8B5CF6),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF22C55E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                ),
                onPressed: () {},
                child: const Text(
                  'Simpan',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
