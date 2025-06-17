// shipping_page.dart
import 'package:flutter/material.dart';

class ShippingPage extends StatelessWidget {
  const ShippingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pengiriman")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Alamat Pengiriman", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            TextField(decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Masukkan alamat")),
            SizedBox(height: 20),
            Text("Metode Pengiriman", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            // Tambah pilihan pengiriman, dropdown atau radio button
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: null, // nanti diganti sesuai aksi
              child: Text("Konfirmasi Pengiriman"),
            ),
          ],
        ),
      ),
    );
  }
}
