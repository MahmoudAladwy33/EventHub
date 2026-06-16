import '../../../../Core/networking/api_result.dart';
import '../../../../Core/errors/app_failure.dart';
import '../data_sources/events_remote_data_source.dart';
import '../entities/event_entity.dart';
import '../entities/event_query.dart';

abstract class EventsRepository {
  Future<ApiResult<EventPage>> getEvents(EventQuery query);
  Future<ApiResult<EventEntity>> getEventDetails(String eventId);
}

class EventsRepositoryImpl implements EventsRepository {
  const EventsRepositoryImpl(this._remoteDataSource);

  final EventsRemoteDataSource _remoteDataSource;

  @override
  Future<ApiResult<EventPage>> getEvents(EventQuery query) async {
    try {
      final result = await _remoteDataSource.getEvents(query);
    var events = result.events
    .map((e) => e.toEntity())
    .whereType<EventEntity>()
    .toList();

if (query.hasPriceFilter) {
  events = events.where((event) {
    if (!event.hasPrice) return false;

    return event.maxPrice >= query.minPrice! &&
        event.minPrice <= query.maxPrice!;
  }).toList();
}

      final page = EventPage(
        events: events,
        page: result.page,
        totalPages: result.totalPages,
      );
      return ApiResult.success(page);
    } catch (error) {
      return ApiResult.failure(AppFailure.fromException(error));
    }
  }

  @override
  Future<ApiResult<EventEntity>> getEventDetails(String eventId) async {
    try {
      final detail = (await _remoteDataSource.getEventDetails(eventId)).toEntity();
      return ApiResult.success(detail);
    } catch (error) {
      return ApiResult.failure(AppFailure.fromException(error));
    }
  }
}
