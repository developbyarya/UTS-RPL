import 'dart:io';

import 'package:flutter/material.dart';
import 'package:posapp/presentation/components/reuseable/image_picker.dart';
import 'package:posapp/controller/productController.dart';

class TambahProdukPage extends StatefulWidget {
  TambahProdukPage({super.key,});
  String? imagePath = '';

  @override
  State<TambahProdukPage> createState() => _TambahProdukPageState();
}

class _TambahProdukPageState extends State<TambahProdukPage> {
  final _namaController = TextEditingController();
  final _hargaController = TextEditingController();
  final _diskonController = TextEditingController();
  final _sumberController = TextEditingController();
  final _hargaBeliController = TextEditingController();
  final _stokController = TextEditingController();
  final _barcodeController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _namaController.dispose();
    _hargaController.dispose();
    _diskonController.dispose();
    _sumberController.dispose();
    _hargaBeliController.dispose();
    _stokController.dispose();
    _barcodeController.dispose();
    super.dispose();
  }

  Future<void> _simpanProduk() async {
    if (widget.imagePath == null || widget.imagePath!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Mohon pilih gambar produk!')),
      );
      return;
    }
    setState(() { _isLoading = true; });
    final controller = ProductController();
    final success = await controller.createProduct(
      name: _namaController.text,
      description: 'Deskripsi produk', // TODO: add field if needed
      price: int.tryParse(_hargaController.text) ?? 0,
      stock: int.tryParse(_stokController.text) ?? 0,
      imagePath: widget.imagePath!,
      category: '1', // TODO: dynamic category
      discount: double.tryParse(_diskonController.text) ?? 0.0,
    );
    setState(() { _isLoading = false; });
    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Produk berhasil disimpan!')),
      );
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal menyimpan produk!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: const Text('Tambah Produk'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nama Produk
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const Text('Nama Produk'),
                const SizedBox(height: 8,),
                TextField(
                  controller: _namaController,
                  decoration: InputDecoration(
                    labelText: 'Nama Produk',
                  border: OutlineInputBorder(),
                ),
              ),
              ]
            ),
            const SizedBox(height: 12),

            // Harga Produk & Diskon
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Harga Produk'),
                      const SizedBox(height: 8,),
                      TextField(
                        controller: _hargaController,
                        decoration: InputDecoration(
                          labelText: 'Harga Produk',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Diskon'),
                      const SizedBox(height: 8,),
                      TextField(
                        controller: _diskonController,
                        decoration: InputDecoration(
                          labelText: 'Diskon',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Sumber
            const Text(
              'Sumber',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            TextField(
              controller: _sumberController,
              decoration: InputDecoration(
                labelText: 'Nama Sumber',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            // Harga Beli & Stok
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: _hargaBeliController,
                    decoration: InputDecoration(
                      labelText: 'Harga Beli',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: _stokController,
                    decoration: InputDecoration(
                      labelText: 'Stok',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Tombol Tambah Sumber
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Tambah sumber', style: TextStyle(color: Colors.white),),
             
              ),
            ),
            const SizedBox(height: 24),

            // Barcode dan Scan
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _barcodeController,
                    decoration: InputDecoration(
                      labelText: 'Kode (Barcode)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.qr_code_scanner, color: Colors.white,),
                  label: const Text('Scan', style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    textStyle: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Tambahkan Foto
            SizedBox(
              width: double.infinity,
              child: CustomizeImagePicker.imagePickerButton(context, "Tambah Foto", onImagePicked: (imagePath) {
                setState(() {
                  widget.imagePath = imagePath;
                });
              }),
            ),

            widget.imagePath != '' ? Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  File(widget.imagePath!),
                  fit: BoxFit.cover,
                ),
              ),
            ) : Container(),

            // Tombol Simpan
            SizedBox(
              width: double.infinity,
              child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : ElevatedButton(
                    onPressed: _isLoading ? null : _simpanProduk,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,  
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Simpan', style: TextStyle(color: Colors.white),),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
