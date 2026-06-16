import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/entities/saved_event_model.dart';
import '../../data/repos/saved_events_repository.dart';
import 'saved_events_state.dart';

class SavedEventsCubit extends Cubit<SavedEventsState> {
  final SavedEventsRepository _repository;

  SavedEventsCubit(this._repository) : super(SavedEventsInitial());

  Future<void> loadSavedEvents() async {
    emit(SavedEventsLoading());
    try {
      final events = await _repository.getSavedEvents();
      emit(SavedEventsLoaded(events));
    } catch (e) {
      emit(SavedEventsError(e.toString()));
    }
  }

  Future<void> toggleSavedEvent(SavedEventModel event) async {
    try {
      final isSaved = await _repository.isEventSaved(event.id);
      if (isSaved) {
        await _repository.removeEvent(event.id);
      } else {
        await _repository.saveEvent(event);
      }

      await loadSavedEvents();
    } catch (e) {
      emit(SavedEventsError(e.toString()));
    }
  }

  bool isEventSaved(String eventId) {
    if (state is SavedEventsLoaded) {
      final events = (state as SavedEventsLoaded).savedEvents;
      return events.any((e) => e.id == eventId);
    }
    return false;
  }
}
