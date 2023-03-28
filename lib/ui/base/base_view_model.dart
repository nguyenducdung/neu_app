import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:neu_app/network/api_repository.dart';
import 'package:neu_app/prefrence/local_repository.dart';
import 'package:rxdart/subjects.dart';

class BaseViewModel {
  @protected
  final LocalRepository localRepository;
  @protected
  final YouthNeuRepository apiRepository;
  BehaviorSubject<bool> isLoading = BehaviorSubject<bool>.seeded(false);

  BaseViewModel(this.localRepository, this.apiRepository);

  void handleError(Object exception) {
    Map<String, dynamic>? error =
        ((exception as DioError?)?.response?.data as Map<String, dynamic>?);
    String errorMessage = error?["message"]?.toString() ?? '';
    print(errorMessage + '===1111112233');
    String messageContent = '';
    if (errorMessage.contains('USER_NOT_FOUND')) {
      messageContent = 'Người dùng không tồn tại';
    } else if (errorMessage.contains('USER_ALREADY_EXISTS')) {
      messageContent = 'Người dùng đã tồn tại';
    } else if (errorMessage.contains('PHONE_NUMBER_ALREADY_EXIST')) {
      messageContent = 'Số điện thoại đã tồn tại';
    } else if (errorMessage.contains('EMAIL_ALREADY_EXIST')) {
      messageContent = 'Email đã tồn tại';
    } else if (errorMessage.contains('STORE_NAME_ALREADY_EXIST')) {
      messageContent = 'Tên cửa hàng đã tồn tại';
    } else if (errorMessage.contains('USER_DOES_NOT_ACTIVE')) {
      messageContent = 'Người dùng chưa được active';
    } else if (errorMessage.contains('INVALID_CREDENTIALS')) {
      messageContent = 'Vui lòng kiểm tra lại mật khẩu';
    } else if (errorMessage.contains('PRODUCT_NOT_FOUND')) {
      messageContent = 'Sản phẩm không tồn tại';
    } else if (errorMessage.contains('PRODUCT_ARE_ON_ORDER')) {
      messageContent = 'Sản phẩm đang nằm trong một đơn hàng';
    } else if (errorMessage.contains('PRODUCT_IS_OUT_OF_STOCK')) {
      messageContent = 'Sản phẩm đang hết hàng';
    } else if (errorMessage.contains('PRODUCT_COLOR_NOT_FOUND')) {
      messageContent = 'Màu sản phẩm không tồn tại';
    } else if (errorMessage.contains('ORDER_NOT_FOUND')) {
      messageContent = 'Đơn hàng không tồn tại';
    } else if (errorMessage.contains('INVALID_PRODUCT_TO_REVIEW')) {
      messageContent = 'Sản phẩm không được quyền đánh giá';
    } else if (errorMessage.contains('USER_ALREADY_REVIEWED_PRODUCT')) {
      messageContent = 'Sản phẩm đã được đánh giá';
    } else if (errorMessage.contains('USER_HAS_BEEN_DELETED')) {
      messageContent = 'Tài khoản người dùng không tồn tại';
    } else if (errorMessage.contains('SALE_PRICE_NOT_VALID')) {
      messageContent = 'Giá sale không hợp lệ';
    } else if (errorMessage.contains('INVALID_CATEGORY_ITEM')) {
      messageContent = 'Danh mục con không hợp lệ';
    } else if (errorMessage.contains('Unauthorized')) {
      messageContent = 'Bạn cần đăng nhập để sử dụng tính năng này';
    } else if (errorMessage.isEmpty) {
    } else {
      messageContent = errorMessage;
    }
  }
}
