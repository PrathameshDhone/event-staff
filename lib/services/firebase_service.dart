import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_staff_app/model/booking.dart';

class FirebaseService {
  static final _db = FirebaseFirestore.instance;

  static Future<Booking> getBookingDetails(String bookingId) async {
    final doc = await _db.collection("bookings").doc(bookingId).get();
    if (!doc.exists) throw Exception("Booking not found");

    return Booking.fromMap(doc.data()!);
  }

  static Future<void> markAsCheckedIn(String bookingId) async {
    await _db.collection("bookings").doc(bookingId).update({
      "checkedIn": true,
    });
  }
}
