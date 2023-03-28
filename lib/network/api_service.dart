import 'dart:io';

import 'package:dio/dio.dart';
import 'package:neu_app/di.dart';
import 'package:neu_app/network/api_key.dart';
import 'package:neu_app/prefrence/local_repository.dart';

class ApiDio {
  late Dio _dio;

  ApiDio(String baseUrl) {
    var options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: ApiKey.timeOut,
      receiveTimeout: ApiKey.timeOut,
    );
    _dio = Dio(options);
    _dio.interceptors
        .add(LogInterceptor(responseBody: true, requestBody: true));
  }

  Dio getDio() {
    return _dio;
  }
}

class ApiService {
  static late ApiService? _instance = null;
  late ApiDio _apiDio;

  ApiService() {
    _apiDio = ApiDio(ApiKey().getBaseUrl());
  }

  static ApiService getInstance() {
    _instance ??= ApiService();
    return _instance!;
  }

  //get
  Future _get(String url, Map<String, dynamic>? params) async {
    var accessToken = getIt<LocalRepository>().getAccessToken();
    Map<String, dynamic> headers = {"Authorization": "Bearer $accessToken"};
    var response = await _apiDio
        .getDio()
        .get(url, queryParameters: params, options: Options(headers: headers));
    return response.data;
  }

  //post
  Future _post(String url, Map<String, dynamic>? params) async {
    var accessToken = getIt<LocalRepository>().getAccessToken();
    Map<String, dynamic> headers = {"Authorization": "Bearer $accessToken"};
    var response = await _apiDio
        .getDio()
        .post(url, data: params, options: Options(headers: headers));
    return response.data;
  }

  //put
  Future _put(String url, Map<String, dynamic>? params) async {
    var accessToken = getIt<LocalRepository>().getAccessToken();
    Map<String, dynamic> headers = {"Authorization": "Bearer $accessToken"};
    var response = await _apiDio
        .getDio()
        .put(url, data: params, options: Options(headers: headers));
    return response.data;
  }

  //delete
  Future _delete(String url) async {
    var accessToken = getIt<LocalRepository>().getAccessToken();
    Map<String, dynamic> headers = {"Authorization": "Bearer $accessToken"};
    var response =
        await _apiDio.getDio().delete(url, options: Options(headers: headers));
    return response.data;
  }

  //delete params
  Future _deleteParams(String url, Map<String, dynamic>? params) async {
    var accessToken = getIt<LocalRepository>().getAccessToken();
    Map<String, dynamic> headers = {"Authorization": "Bearer $accessToken"};
    var response =
        await _apiDio.getDio().delete(url, data: params, options: Options(headers: headers));
    return response.data;
  }

  Future _uploadFile(String url, File file) async {
    String fileName = file.path.split('/').last.replaceAll(' ', '');
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path, filename: fileName),
    });
    print('===== path: ${file.path}_$fileName');
    var accessToken = getIt<LocalRepository>().getAccessToken();
    Map<String, dynamic> headers = {"Authorization": "Bearer $accessToken"};
    var response = await _apiDio
        .getDio()
        .post(url, data: formData, options: Options(headers: headers));
    return response.data;
  }

  Future _uploadMultiFile(String url, List<File> files) async {
    List<MultipartFile> filesMap = [];
    for (var file in files) {
      String fileName = file.path.split('/').last.replaceAll('trim.', '').replaceAll(' ', '');
      filesMap.add(await MultipartFile.fromFile(file.path, filename: fileName));
    }
    FormData formData = FormData.fromMap({
      "files": filesMap,
    });
    var accessToken = getIt<LocalRepository>().getAccessToken();
    Map<String, dynamic> headers = {"Authorization": "Bearer $accessToken", "Content-Type": "multipart/form-data"};
    var response = await _apiDio
        .getDio()
        .post(url, data: formData, options: Options(headers: headers));
    return response.data;
  }

  Future _uploadFileFromPath(String url, String path, String fileName) async {
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(path, filename: fileName),
    });
    var accessToken = getIt<LocalRepository>().getAccessToken();
    Map<String, dynamic> headers = {"Authorization": "Bearer $accessToken"};
    var response = await _apiDio
        .getDio()
        .post(url, data: formData, options: Options(headers: headers));
    return response.data;
  }

  Stream post({required String url, Map<String, dynamic>? params}) =>
      Stream.fromFuture(_post(url, params)).asBroadcastStream();

  Stream put({required String url, Map<String, dynamic>? params}) =>
      Stream.fromFuture(_put(url, params)).asBroadcastStream();

  Stream delete({required String url}) =>
      Stream.fromFuture(_delete(url)).asBroadcastStream();

  Stream deleteParams({required String url, Map<String, dynamic>? params}) =>
      Stream.fromFuture(_deleteParams(url, params)).asBroadcastStream();

  Stream uploadFile({required String url, required File file}) =>
      Stream.fromFuture(_uploadFile(url, file)).asBroadcastStream();

  Stream uploadMultiFile({required String url, required List<File> files}) =>
      Stream.fromFuture(_uploadMultiFile(url, files)).asBroadcastStream();

  Stream uploadFileFromPath({required String url, required String path, required String name}) =>
      Stream.fromFuture(_uploadFileFromPath(url, path, name)).asBroadcastStream();

  Stream get({required String url, Map<String, dynamic>? params}) =>
      Stream.fromFuture(_get(url, params)).asBroadcastStream();
}
