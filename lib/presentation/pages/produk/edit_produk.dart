import 'package:flutter/material.dart';
import 'package:posapp/domain/model/item_model.dart';
import 'package:posapp/presentation/components/reuseable/image_picker.dart';
import 'dart:io';
class EditProdukPage extends StatefulWidget {
  EditProdukPage({super.key, required this.item});
  final ItemModel item;
  bool imageChanged = false;

  @override
  State<EditProdukPage> createState() => _EditProdukPageState();
}

class _EditProdukPageState extends State<EditProdukPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: const Text('Edit Produk'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Produk & Ganti Foto
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: widget.imageChanged ? Image.file(
                    File(widget.item.imageUrl!),
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ) : Image.asset(
                    widget.item.imageUrl ?? 'assets/dummy_product_image/oreo.png', // contoh gambar oreo
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    children: [
                      CustomizeImagePicker.imagePickerButton(context, "Ganti Foto", onImagePicked: (imagePath) {
                        setState(() {
                          widget.item.imageUrl = imagePath;
                          widget.imageChanged = true;
                        });
                      }),
                      const SizedBox(height: 12),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Kode (Barcode)', 
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.qr_code),
                        ),
                        controller: TextEditingController(text: widget.item.barcode),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Nama Produk
            TextField(
              decoration: InputDecoration(
                labelText: 'Nama Produk',
                border: OutlineInputBorder(),
              ),
              controller: TextEditingController(text: widget.item.name),
            ),
            const SizedBox(height: 12),

            // Harga Produk & Diskon
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Harga Produk',
                      border: OutlineInputBorder(),
                    ),
                    controller: TextEditingController(text: widget.item.price.toString()),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Diskon',
                      border: OutlineInputBorder(),
                    ),
                    controller: TextEditingController(text: widget.item.discount.toString()),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            const Text(
              'Sumber & Stok',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Divider(),

            // Info sumber dan stok
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sumber Grosir: ${widget.item.sourceName}',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 4),
                        Text('Stok: ${widget.item.stock}    Harga Beli: Rp. ${widget.item.purchasePrice}'),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const Divider(height: 24),

            // Tombol Simpan
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
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
