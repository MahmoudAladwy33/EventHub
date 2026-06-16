import 'package:equatable/equatable.dart';
import '../../data/entities/saved_event_model.dart';

abstract class SavedEventsState extends Equatable {
  const SavedEventsState();

  @override
  List<Object?> get props => [];
}

class SavedEventsInitial extends SavedEventsState {}

class SavedEventsLoading extends SavedEventsState {}

class SavedEventsLoaded extends SavedEventsState {
  final List<SavedEventModel> savedEvents;

  const SavedEventsLoaded(this.savedEvents);

  @override
  List<Object?> get props => [savedEvents];
}

class SavedEventsError extends SavedEventsState {
  final String message;

  const SavedEventsError(this.message);

  @override
  List<Object?> get props => [message];
}
