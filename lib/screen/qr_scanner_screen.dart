import 'package:event_staff_app/provider/qr_provider.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QRScannerScreen extends ConsumerWidget {
  const QRScannerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scan QR Code")),
      body: MobileScanner(
        onDetect: (barcodeCapture) {
          final barcode = barcodeCapture.barcodes.first;
          final qrCode = barcode.rawValue;
          if (qrCode != null) {
            ref.read(qrProvider.notifier).fetchBooking(qrCode);
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
