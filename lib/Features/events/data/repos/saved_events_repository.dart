import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../entities/saved_event_model.dart';

abstract class SavedEventsRepository {
  Future<void> saveEvent(SavedEventModel event);
  Future<void> removeEvent(String eventId);
  Future<List<SavedEventModel>> getSavedEvents();
  Future<bool> isEventSaved(String eventId);
}

class SavedEventsRepositoryImpl implements SavedEventsRepository {
  final SharedPreferences _prefs;
  static const String _savedEventsKey = 'saved_events_v2';

  SavedEventsRepositoryImpl(this._prefs);

  @override
  Future<List<SavedEventModel>> getSavedEvents() async {
    final String? eventsJson = _prefs.getString(_savedEventsKey);
    if (eventsJson == null || eventsJson.isEmpty) {
      return [];
    }

    try {
      final List<dynamic> decodedList = json.decode(eventsJson);
      return decodedList.map((e) => SavedEventModel.fromJson(e as Map<String, dynamic>)).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> saveEvent(SavedEventModel event) async {
    final events = await getSavedEvents();
    if (!events.any((e) => e.id == event.id)) {
      events.add(event);
      final String encodedList = json.encode(events.map((e) => e.toJson()).toList());
      await _prefs.setString(_savedEventsKey, encodedList);
    }
  }

  @override
  Future<void> removeEvent(String eventId) async {
    final events = await getSavedEvents();
    events.removeWhere((e) => e.id == eventId);
    final String encodedList = json.encode(events.map((e) => e.toJson()).toList());
    await _prefs.setString(_savedEventsKey, encodedList);
  }

  @override
  Future<bool> isEventSaved(String eventId) async {
    final events = await getSavedEvents();
    return events.any((e) => e.id == eventId);
  }
}

