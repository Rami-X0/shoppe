import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoppe/core/networking/api_error_model.dart';
part 'api_result.freezed.dart';
@freezed
class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Sucess<T>;

  const factory ApiResult.failure(ApiErrorModel networkExceptions) = Failure<T>;
}
