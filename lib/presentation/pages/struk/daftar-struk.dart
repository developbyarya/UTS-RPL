import 'package:flutter/material.dart';
import 'package:posapp/presentation/pages/struk/detail-struk.dart';

class DaftarStrukPage extends StatelessWidget {
  DaftarStrukPage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> receipts = [
    {
      'date': DateTime(2025, 4, 20),
      'items': [
        {'amount': 5000, 'time': '10:34 AM', 'number': '#2-1009'},
        {'amount': 10000, 'time': '09:34 AM', 'number': '#2-1009'},
        {'amount': 6000, 'time': '08:12 AM', 'number': '#2-1009'},
        {'amount': 9000, 'time': '06:11 AM', 'number': '#2-1009'},
      ],
    },
    {
      'date': DateTime(2025, 4, 19),
      'items': [
        {'amount': 9000, 'time': '06:11 AM', 'number': '#2-1009'},
        {'amount': 9000, 'time': '06:11 AM', 'number': '#2-1009'},
        {'amount': 9000, 'time': '06:11 AM', 'number': '#2-1009'},
        {'amount': 9000, 'time': '06:11 AM', 'number': '#2-1009'},
      ],
    },
  ];

  String getDayName(DateTime date) {
    final days = [
      'Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'
    ];
    return days[date.weekday % 7];
  }

  String formatDate(DateTime date) {
    final months = [
      '', 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
      'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
    ];
    return '${getDayName(date)}, ${date.day} ${months[date.month]} ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Struk Pembayaran'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari Struk Pembayaran',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: receipts.length,
              itemBuilder: (context, i) {
                final group = receipts[i];
                final date = group['date'] as DateTime;
                final items = group['items'] as List;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                      child: Text(
                        formatDate(date),
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    ...items.map<Widget>((item) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey.shade200),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.05),
                              blurRadius: 2,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailStrukPage(/* pass item if needed */),
                              ),
                            );
                          },
                          child: ListTile(
                            leading: Icon(Icons.attach_money, size: 32),
                            title: Text(
                              'Rp ${item['amount']}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            subtitle: Text(
                              item['time'],
                              style: TextStyle(fontSize: 13),
                            ),
                            trailing: Text(
                              item['number'],
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          ),
                        ),
                      ),
                    )),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xFFF8F8F8),
    );
  }
}
