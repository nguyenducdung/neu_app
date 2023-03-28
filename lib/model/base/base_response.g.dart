// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse<T> _$BaseResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseResponse<T>(
      json['error_code'] as dynamic,
      json['message'] as String?,
      fromJsonT(json['result']),
      json['traceId'] as String?,
    );

Map<String, dynamic> _$BaseResponseToJson<T>(
  BaseResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'message': instance.message,
      'result': toJsonT(instance.result),
      'traceId': instance.traceId,
    };
