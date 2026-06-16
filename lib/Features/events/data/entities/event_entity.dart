class EventEntity {
  const EventEntity({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.dateTime,
    required this.dateLabel,
    required this.timeLabel,
    required this.venue,
    required this.address,
    required this.locationLabel,
    required this.organizer,
    required this.organizerImageUrl,
    required this.description,
    required this.category,
    required this.minPrice,
    required this.maxPrice,
    required this.currency,
    required this.priceLabel,
    required this.hasPrice,
    required this.latitude,
    required this.longitude,
    required this.distance,
    required this.distanceLabel,
    required this.ticketUrl,
  });

  final String id;
  final String title;
  final String imageUrl;
  final DateTime dateTime;
  final String dateLabel;
  final String timeLabel;
  final String venue;
  final String address;
  final String locationLabel;
  final String organizer;
  final String organizerImageUrl;
  final String description;
  final String category;
  final double minPrice;
  final double maxPrice;
  final String currency;
  final String priceLabel;
  final bool hasPrice;
  final double latitude;
  final double longitude;
  final double distance;
  final String distanceLabel;
  final String ticketUrl;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'dateTime': dateTime.toIso8601String(),
      'dateLabel': dateLabel,
      'timeLabel': timeLabel,
      'venue': venue,
      'address': address,
      'locationLabel': locationLabel,
      'organizer': organizer,
      'organizerImageUrl': organizerImageUrl,
      'description': description,
      'category': category,
      'minPrice': minPrice,
      'maxPrice': maxPrice,
      'currency': currency,
      'priceLabel': priceLabel,
      'hasPrice': hasPrice,
      'latitude': latitude,
      'longitude': longitude,
      'distance': distance,
      'distanceLabel': distanceLabel,
      'ticketUrl': ticketUrl,
    };
  }

  factory EventEntity.fromJson(Map<String, dynamic> json) {
    return EventEntity(
      id: json['id'] as String,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      dateLabel: json['dateLabel'] as String,
      timeLabel: json['timeLabel'] as String,
      venue: json['venue'] as String,
      address: json['address'] as String,
      locationLabel: json['locationLabel'] as String,
      organizer: json['organizer'] as String,
      organizerImageUrl: json['organizerImageUrl'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      minPrice: (json['minPrice'] as num).toDouble(),
      maxPrice: (json['maxPrice'] as num).toDouble(),
      currency: json['currency'] as String,
      priceLabel: json['priceLabel'] as String,
      hasPrice: json['hasPrice'] as bool,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      distance: (json['distance'] as num).toDouble(),
      distanceLabel: json['distanceLabel'] as String,
      ticketUrl: json['ticketUrl'] as String,
    );
  }
}
