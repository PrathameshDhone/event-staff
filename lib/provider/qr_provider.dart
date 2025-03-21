import 'package:event_staff_app/model/booking.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/firebase_service.dart';

final qrProvider =
    StateNotifierProvider<QRProvider, AsyncValue<Booking?>>((ref) {
  return QRProvider();
});

class QRProvider extends StateNotifier<AsyncValue<Booking?>> {
  QRProvider() : super(const AsyncValue.loading());

  Future<void> fetchBooking(String bookingId) async {
    state = const AsyncValue.loading();
    try {
      final booking = await FirebaseService.getBookingDetails(bookingId);
      state = AsyncValue.data(booking);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
