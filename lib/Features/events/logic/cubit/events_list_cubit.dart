import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/Core/networking/api_result.dart';
import '../../data/entities/event_entity.dart';
import '../../data/entities/event_query.dart';
import '../../data/repos/events_repository.dart';

part 'events_list_state.dart';

class EventsListCubit extends Cubit<EventsListState> {
  EventsListCubit(this._repository, {required EventListMode mode})
      : _query = EventQuery(mode: mode),
        super(EventsListState(mode: mode));

  final EventsRepository _repository;
  EventQuery _query;

  Future<void> load({bool refresh = false}) async {
    if (state.isLoadingMore ||
        (!refresh && state.status == ListStatus.loading)) {
      return;
    }
    final nextPage = refresh
        ? 0
        : state.events.isEmpty
            ? 0
            : state.page + 1;
    if (!refresh && state.events.isNotEmpty && !state.hasMore) return;
emit(
  state.copyWith(
    status: refresh ? ListStatus.loading : state.status,
    isLoadingMore: !refresh,
    errorMessage: '',
  ),
);

    final result = await _repository.getEvents(
      _query.copyWith(page: nextPage),
    );

    result.when(
      success: (pageData) {
        emit(
          state.copyWith(
            status: ListStatus.success,
            events: nextPage == 0
                ? List.unmodifiable(pageData.events)
                : List.unmodifiable([...state.events, ...pageData.events]),
            page: pageData.page,
            hasMore: pageData.hasMore,
            isLoadingMore: false,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            status: state.events.isEmpty
                ? ListStatus.failure
                : ListStatus.success,
            isLoadingMore: false,
            errorMessage: failure.message,
          ),
        );
      },
    );
  }

Future<void> changeMode(EventListMode mode) async {
  if (state.mode == mode) return;

  _query = EventQuery(mode: mode);

  emit(
    state.copyWith(
      mode: mode,
      status: ListStatus.loading,
      events: [],
      page: 0,
      hasMore: true,
      isLoadingMore: false,
      errorMessage: '',
    ),
  );

  await load(refresh: true);
}
}
