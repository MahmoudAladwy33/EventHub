import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'ticketmaster_api.g.dart';

@RestApi(baseUrl: 'https://app.ticketmaster.com/discovery/v2/')
abstract class TicketmasterApi {
  factory TicketmasterApi(Dio dio, {String baseUrl}) = _TicketmasterApi;

  @GET('events.json')
  Future<String> getEvents(@Queries() Map<String, dynamic> queries);

  @GET('events/{eventId}.json')
  Future<String> getEventDetails(@Path('eventId') String eventId);

  @GET('classifications.json')
  Future<String> getClassifications();
}
