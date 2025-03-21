import 'package:event_staff_app/provider/qr_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/firebase_service.dart';

class CheckInScreen extends ConsumerWidget {
  const CheckInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookingState = ref.watch(qrProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Booking Details")),
      body: bookingState.when(
        data: (booking) {
          if (booking == null)
            return const Center(child: Text("No booking found"));
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Name: ${booking.name}",
                  style: const TextStyle(fontSize: 20)),
              Text("Package: ${booking.package}",
                  style: const TextStyle(fontSize: 20)),
              booking.checkedIn
                  ? const Text("Already Checked In",
                      style: TextStyle(color: Colors.red))
                  : ElevatedButton(
                      onPressed: () {
                        FirebaseService.markAsCheckedIn(booking.id);
                      },
                      child: const Text("Mark as Checked In"),
                    ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text("Error: $error")),
      ),
    );
  }
}
