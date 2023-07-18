import 'package:dio/dio.dart';

enum ResponseStatus {
  success,
  error,
  noInternet,
}

class DataState {
  ResponseStatus status;
  Response? response;
  String? message;
  dynamic payload;

  DataState({
    required this.status,
    this.response,
    this.message,
    this.payload,
  });
}
