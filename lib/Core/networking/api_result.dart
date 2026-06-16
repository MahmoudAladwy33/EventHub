import 'package:freezed_annotation/freezed_annotation.dart';
import '../errors/app_failure.dart';

part 'api_result.freezed.dart';

@freezed
sealed class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Success<T>;
  const factory ApiResult.failure(AppFailure failure) = Failure<T>;
}
