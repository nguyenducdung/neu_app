import 'package:flutter/foundation.dart';

class ApiKey {
  static const timeOut = 10000;
  static const sortField = "sortField";
  static const sortDirection = "sortDirection";
  static const page = "page";
  static const limit = "limit";
  static const newKey = "new";
  static const name = "name";
  static const productId = "productId";
  static const isSaleOff = "isSaleOff";
  static const hasVideo = "hasVideo";
  static const quantity = "quantity";
  static const color = "color";
  static const image = "image";
  static const phoneNumber = "phoneNumber";
  static const email = "email";
  static const avatar = "avatar";
  static const address = "address";
  static const categoryId = "categoryId";
  static const price = "price";
  static const userId = "userId";
  static const isActive = "isActive";
  static const status = "status";
  static const fromDate = "fromDate";
  static const toDate = "toDate";

  String getBaseUrl() {
    if (kDebugMode) {
      return "http://ninhhieptongkho.com/";
    } else {
      return "http://ninhhieptongkho.com/";
    }
  }

  String getBaseUrlImage() {
    if (kDebugMode) {
      return "http://ninhhieptongkho.com/api/media/";
    } else {
      return "http://ninhhieptongkho.com/api/media/";
    }
  }
}
