import 'package:flutter/material.dart';

class RequestResult<T> {
  RequestResult({
    @required this.success,
    this.status,
    this.data,
    this.error,
  });

  final bool success;
  final int status;
  final T data;
  final String error;
}
