class Worker {
  final String name;
  final String service;
  final double rating;
  final double distanceKm;
  final int hourlyRate;
  final bool verified;

  const Worker({
    required this.name,
    required this.service,
    required this.rating,
    required this.distanceKm,
    required this.hourlyRate,
    required this.verified,
  });
}
