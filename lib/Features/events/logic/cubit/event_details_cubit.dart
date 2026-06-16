import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/Core/networking/api_result.dart';
import '../../data/entities/event_entity.dart';
import '../../data/repos/events_repository.dart';

part 'event_details_state.dart';

class EventDetailsCubit extends Cubit<EventDetailsState> {
  EventDetailsCubit(this._repository) : super(const EventDetailsState());

  final EventsRepository _repository;

  Future<void> load(String eventId) async {
    emit(const EventDetailsState(status: DetailsStatus.loading));
    final result = await _repository.getEventDetails(eventId);
    result.when(
      success: (event) {
        emit(EventDetailsState(status: DetailsStatus.success, event: event));
      },
      failure: (failure) {
        emit(
          EventDetailsState(
            status: DetailsStatus.failure,
            errorMessage: failure.message,
          ),
        );
      },
    );
  }
}
