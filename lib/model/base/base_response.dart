import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  BaseResponse(this.errorCode, this.message, this.result, this.traceId);

  @JsonKey(name: 'error_code')
  dynamic errorCode;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'result')
  T result;

  @JsonKey(name: 'traceId')
  String? traceId;

  int httpStatusCode = 0;

  set setHttpStatusCode(int code) {
    httpStatusCode = code;
  }

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BaseResponseToJson(this, toJsonT);

  isSuccess() {
    return errorCode.toString() == '0';
  }
}
