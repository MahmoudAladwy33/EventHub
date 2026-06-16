import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Features/auth/data/repos/auth_repository.dart';
import '../../Features/auth/logic/cubit/auth_cubit.dart';
import '../../Features/events/data/data_sources/events_remote_data_source.dart';
import '../../Features/events/data/entities/event_query.dart';
import '../../Features/events/data/repos/events_repository.dart';
import '../../Features/events/data/repos/saved_events_repository.dart';
import '../../Features/events/logic/cubit/event_details_cubit.dart';
import '../../Features/events/logic/cubit/events_list_cubit.dart';
import '../../Features/events/logic/cubit/saved_events_cubit.dart';
import '../../Features/events/logic/cubit/search_cubit.dart';
import '../../Features/home/data/data_sources/home_remote_data_source.dart';
import '../../Features/home/data/repos/home_repository.dart';
import '../../Features/home/logic/cubit/home_cubit.dart';
import '../networking/dio_helper.dart';
import '../networking/ticketmaster_api.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Local Storage
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  getIt.registerLazySingleton<FlutterSecureStorage>(() => const FlutterSecureStorage());

  // Networking
  getIt
    ..registerLazySingleton<Dio>(DioHelper.createDio)
    ..registerLazySingleton<TicketmasterApi>(() => TicketmasterApi(getIt<Dio>()))
    
    // Auth Feature
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(getIt(), getIt()),
    )
    ..registerFactory(() => AuthCubit(getIt()))

    // Saved Events Feature
    ..registerLazySingleton<SavedEventsRepository>(
      () => SavedEventsRepositoryImpl(getIt()),
    )
    ..registerLazySingleton<SavedEventsCubit>(
      () => SavedEventsCubit(getIt())..loadSavedEvents(),
    )

    // Home Feature
    ..registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(getIt()),
    )
    ..registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(getIt()))
    ..registerFactory(() => HomeCubit(getIt()))

    // Event Feature
    ..registerLazySingleton<EventsRemoteDataSource>(
      () => EventsRemoteDataSourceImpl(getIt()),
    )
    ..registerLazySingleton<EventsRepository>(
      () => EventsRepositoryImpl(getIt()),
    )
    ..registerFactory(() => SearchCubit(getIt()))
    ..registerFactory(() => EventDetailsCubit(getIt()))
    ..registerFactoryParam<EventsListCubit, EventListMode, void>(
      (mode, _) => EventsListCubit(getIt(), mode: mode),
    );
}
