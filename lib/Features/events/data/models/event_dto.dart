import 'package:intl/intl.dart';
import '../entities/event_entity.dart';

class EventDto {
  const EventDto({
    this.id = '',
    this.name = '',
    this.ticketUrl = '',
    this.imageUrl = '',
    this.localDate = '',
    this.localTime = '',
    this.venue = '',
    this.city = '',
    this.address = '',
    this.organizer = '',
    this.organizerImageUrl = '',
    this.info = '',
    this.pleaseNote = '',
    this.category = '',
    this.minPrice = 0.0,
    this.maxPrice = 0.0,
    this.currency = '',
    this.latitude = 0.0,
    this.longitude = 0.0,
    this.distance = 0.0,
  });

  final String id;
  final String name;
  final String ticketUrl;
  final String imageUrl;
  final String localDate;
  final String localTime;
  final String venue;
  final String city;
  final String address;
  final String organizer;
  final String organizerImageUrl;
  final String info;
  final String pleaseNote;
  final String category;
  final double minPrice;
  final double maxPrice;
  final String currency;
  final double latitude;
  final double longitude;
  final double distance;

  factory EventDto.fromJson(Map<String, dynamic> json) {
    final dates = _asMap(json['dates']);
    final start = _asMap(dates?['start']);

    final embedded = _asMap(json['_embedded']);
    final venues = _asList(embedded?['venues']);
    final venue = venues.whereType<Map<String, dynamic>>().firstOrNull;

    final city = _asMap(venue?['city']);
    final address = _asMap(venue?['address']);

    final images =
        _asList(
          json['images'],
        ).whereType<Map<String, dynamic>>().toList()..sort(
          (a, b) =>
              ((b['width'] as num?) ?? 0).compareTo((a['width'] as num?) ?? 0),
        );

    final priceRanges = _asList(json['priceRanges']);
    final price = priceRanges.whereType<Map<String, dynamic>>().firstOrNull;

    return EventDto(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      ticketUrl: json['url'] ?? '',
      imageUrl: images.firstOrNull?['url'] ?? '',
      localDate: start?['localDate'] ?? '',
      localTime: start?['localTime'] ?? '',
      venue: venue?['name'] ?? '',
      city: city?['name'] ?? '',
      address: address?['line1'] ?? '',
      organizer: '',
      organizerImageUrl: '',
      info: json['info'] ?? '',
      pleaseNote: json['pleaseNote'] ?? '',
      category: '',
      minPrice: (price?['min'] as num?)?.toDouble() ?? 0.0,
      maxPrice: (price?['max'] as num?)?.toDouble() ?? 0.0,
      currency: price?['currency'] ?? '',
      latitude:
          double.tryParse(venue?['location']?['latitude']?.toString() ?? '') ??
          0.0,
      longitude:
          double.tryParse(venue?['location']?['longitude']?.toString() ?? '') ??
          0.0,
      distance: (json['distance'] as num?)?.toDouble() ?? 0.0,
    );
  }

  EventEntity toEntity() {
    final parsedDate =
        DateTime.tryParse(localDate) ?? DateTime.fromMillisecondsSinceEpoch(0);

    final parsedTime = _parseTime(localTime);

    final eventDateTime = DateTime(
      parsedDate.year,
      parsedDate.month,
      parsedDate.day,
      parsedTime?.hour ?? 0,
      parsedTime?.minute ?? 0,
    );

    final hasKnownPrice = minPrice > 0 || maxPrice > 0;

    final safeMinPrice = minPrice > 0 ? minPrice : maxPrice;
    final safeMaxPrice = maxPrice > 0 ? maxPrice : minPrice;

    final locationParts = [
      venue,
      address,
      city,
    ].where((e) => e.trim().isNotEmpty).toList();

    final descriptionParts = [
      info,
      pleaseNote,
    ].where((e) => e.trim().isNotEmpty).toList();

    final dateLabel = localDate.isEmpty
        ? 'Date to be announced'
        : DateFormat('EEE, MMM d').format(parsedDate).toUpperCase();

    final timeLabel = parsedTime == null
        ? 'Time to be announced'
        : DateFormat('h:mm a').format(eventDateTime);

    return EventEntity(
      id: id.isNotEmpty ? id : 'unknown-event',
      title: name.isNotEmpty ? name : 'Untitled event',
      imageUrl: imageUrl,
      dateTime: eventDateTime,

      dateLabel: dateLabel,
      timeLabel: timeLabel,

      venue: venue,
      address: address,

      locationLabel: locationParts.isEmpty
          ? 'Location to be announced'
          : locationParts.join(', '),

      organizer: organizer,
      organizerImageUrl: organizerImageUrl,

      description: descriptionParts.isEmpty
          ? 'No additional event information is available.'
          : descriptionParts.join('\n\n'),

      category: category,

      minPrice: safeMinPrice,
      maxPrice: safeMaxPrice,
      currency: currency.isEmpty ? 'USD' : currency,

      priceLabel: hasKnownPrice ? '$safeMinPrice - $safeMaxPrice' : 'N/A',

      hasPrice: hasKnownPrice,

      latitude: latitude,
      longitude: longitude,
      distance: distance,

      distanceLabel: distance > 0
          ? '${distance.toStringAsFixed(1)} km away'
          : '',

      ticketUrl: ticketUrl,
    );
  }

  static DateTime? _parseTime(String value) {
    if (value.isEmpty) return null;
    return DateTime.tryParse('2000-01-01T$value');
  }

  static Map<String, dynamic>? _asMap(Object? value) {
    return value is Map<String, dynamic> ? value : null;
  }

  static List<dynamic> _asList(Object? value) {
    return value is List<dynamic> ? value : const [];
  }
}

extension FirstOrNullExt<T> on List<T> {
  T? get firstOrNull => isEmpty ? null : first;
}
