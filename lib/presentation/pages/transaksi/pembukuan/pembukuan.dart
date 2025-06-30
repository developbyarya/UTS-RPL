import 'package:flutter/material.dart';

class PembukuanPage extends StatefulWidget {
  const PembukuanPage({Key? key}) : super(key: key);

  @override
  State<PembukuanPage> createState() => _PembukuanPageState();
}

class _PembukuanPageState extends State<PembukuanPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembukuan', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey[200],
            child: TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: 'Penjualan Barang'),
                Tab(text: 'Brilink'),
              ],
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.grey,
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _PenjualanBarangTable(),
                _BrilinkTable(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF22D060),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {},
            child: const Text('Export Ke Excell', style: TextStyle(fontSize: 16)),
          ),
        ),
      ),
    );
  }
}

class _PenjualanBarangTable extends StatelessWidget {
  final List<Map<String, String>> data = const [
    {'Nama barang': 'Barang A', 'Jumlah Terjual': '10', 'Harga satuan': '10.000', 'Total penjualan': '100.000'},
    {'Nama barang': 'Barang B', 'Jumlah Terjual': '5', 'Harga satuan': '20.000', 'Total penjualan': '100.000'},
    {'Nama barang': 'Barang C', 'Jumlah Terjual': '8', 'Harga satuan': '15.000', 'Total penjualan': '120.000'},
    {'Nama barang': 'Barang D', 'Jumlah Terjual': '12', 'Harga satuan': '8.000', 'Total penjualan': '96.000'},
    {'Nama barang': 'Barang E', 'Jumlah Terjual': '7', 'Harga satuan': '12.000', 'Total penjualan': '84.000'},
  ];

  _PenjualanBarangTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red[50],
          borderRadius: BorderRadius.circular(8),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Nama barang')),
              DataColumn(label: Text('Jumlah Terjual')),
              DataColumn(label: Text('Harga satuan')),
              DataColumn(label: Text('Total penjualan')),
            ],
            rows: data.map((row) {
              return DataRow(
                cells: [
                  DataCell(Text(row['Nama barang']!)),
                  DataCell(Text(row['Jumlah Terjual']!)),
                  DataCell(Text(row['Harga satuan']!)),
                  DataCell(Text(row['Total penjualan']!)),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _BrilinkTable extends StatelessWidget {
  final List<Map<String, String>> data = const [
    {'Jenis Transaksi': 'Transfer', 'Pemasukan': '50.000'},
    {'Jenis Transaksi': 'Pembayaran', 'Pemasukan': '30.000'},
    {'Jenis Transaksi': 'Setor Tunai', 'Pemasukan': '20.000'},
    {'Jenis Transaksi': 'Tarik Tunai', 'Pemasukan': '40.000'},
  ];

  _BrilinkTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red[50],
          borderRadius: BorderRadius.circular(8),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Jenis Transaksi')),
              DataColumn(label: Text('Pemasukan')),
            ],
            rows: data.map((row) {
              return DataRow(
                cells: [
                  DataCell(Text(row['Jenis Transaksi']!)),
                  DataCell(Text(row['Pemasukan']!)),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
