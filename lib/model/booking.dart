class Booking {
  final String id;
  final String name;
  final String package;
  final bool checkedIn;

  Booking(
      {required this.id,
      required this.name,
      required this.package,
      this.checkedIn = false});

  factory Booking.fromMap(Map<String, dynamic> data) {
    return Booking(
      id: data['id'],
      name: data['name'],
      package: data['package'],
      checkedIn: data['checkedIn'] ?? false,
    );
  }
}
