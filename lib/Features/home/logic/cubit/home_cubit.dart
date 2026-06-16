import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_project/Core/networking/api_result.dart';
import '../../data/entities/home_category_entity.dart';
import '../../data/entities/home_event_entity.dart';
import '../../data/repos/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._repository) : super(const HomeState());

  final HomeRepository _repository;

  Future<void> load() async {
    emit(state.copyWith(status: HomeStatus.loading, errorMessage: ''));
    final result = await _repository.getHomeData();
    result.when(
      success: (data) {
        emit(
          state.copyWith(
            status: HomeStatus.success,
            categories: List.unmodifiable(data.categories),
            upcomingEvents: List.unmodifiable(data.upcomingEvents),
            nearbyEvents: List.unmodifiable(data.nearbyEvents),
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            status: HomeStatus.failure,
            errorMessage: failure.message,
          ),
        );
      },
    );
  }
}
