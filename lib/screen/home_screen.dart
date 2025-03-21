import 'package:flutter/material.dart';
import 'qr_scanner_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Staff QR Scanner")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QRScannerScreen()),
            );
          },
          child: const Text("Scan QR Code"),
        ),
      ),
    );
  }
}
