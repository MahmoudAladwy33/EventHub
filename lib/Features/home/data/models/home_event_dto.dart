import 'package:json_annotation/json_annotation.dart';
import 'package:intl/intl.dart';
import '../entities/home_event_entity.dart';

part 'home_event_dto.g.dart';

@JsonSerializable()
class HomeEventDto {
  final String id;
  final String name;
  final String imageUrl;
  final String localDate;
  final String localTime;
  final String venueName;
  final String city;
  final String address;
  final double distance;

  const HomeEventDto({
    this.id = '',
    this.name = '',
    this.imageUrl = '',
    this.localDate = '',
    this.localTime = '',
    this.venueName = '',
    this.city = '',
    this.address = '',
    this.distance = 0.0,
  });

  factory HomeEventDto.fromJson(Map<String, dynamic> json) {
    final dates = _asMap(json['dates']);
    final start = _asMap(dates?['start']);
    final embedded = _asMap(json['_embedded']);
    final venues = _asList(embedded?['venues']);
    final venue = venues.whereType<Map<String, dynamic>>().firstOrNull;

    final city = _asMap(venue?['city']);
    final address = _asMap(venue?['address']);

    final images = _asList(json['images'])
        .whereType<Map<String, dynamic>>()
        .toList();

    images.sort(
      (a, b) => ((b['width'] as num?) ?? 0)
          .compareTo((a['width'] as num?) ?? 0),
    );

    return HomeEventDto(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      imageUrl: images.firstOrNull?['url'] ?? '',
      localDate: start?['localDate'] ?? '',
      localTime: start?['localTime'] ?? '',
      venueName: venue?['name'] ?? '',
      city: city?['name'] ?? '',
      address: address?['line1'] ?? '',
      distance: (json['distance'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() => _$HomeEventDtoToJson(this);

  HomeEventEntity toEntity() {
    final parsedDate = DateTime.tryParse(localDate);

    final dateLabel = parsedDate == null
        ? 'Date to be announced'
        : DateFormat('EEE, MMM d').format(parsedDate).toUpperCase();

    final time = _formatTime(localTime);

    final locationParts = [
      venueName,
      address,
      city,
    ].where((v) => v.trim().isNotEmpty);

    return HomeEventEntity(
      id: id.trim().isNotEmpty ? id.trim() : 'unknown-event',
      title: name.trim().isNotEmpty ? name.trim() : 'Untitled event',
      imageUrl: imageUrl,
      day: parsedDate == null ? '--' : DateFormat('dd').format(parsedDate),
      month: parsedDate == null
          ? 'TBA'
          : DateFormat('MMM').format(parsedDate).toUpperCase(),
      dateLabel: time.isEmpty ? dateLabel : '$dateLabel - $time',
      location: locationParts.isEmpty
          ? 'Location to be announced'
          : locationParts.join(', '),
      distanceLabel:
          distance > 0 ? '${distance.toStringAsFixed(1)} km away' : '',
    );
  }

  static String _formatTime(String value) {
    if (value.isEmpty) return '';
    final date = DateTime.tryParse('2000-01-01T$value');
    return date == null ? '' : DateFormat('h:mm a').format(date);
  }

  static Map<String, dynamic>? _asMap(Object? value) {
    return value is Map<String, dynamic> ? value : null;
  }

  static List<dynamic> _asList(Object? value) {
    return value is List<dynamic> ? value : const [];
  }
}