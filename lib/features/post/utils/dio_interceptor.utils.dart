import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

var _logger = Logger();

final dioInterceptor = InterceptorsWrapper(
  onRequest: (options, handler) {
    _logger.d(
      '====== DIO REQUEST ======\n'
      'URI: ${options.uri}\n'
      'HEADERS: ${options.headers.toString()}\n'
      'METHOD: ${options.method}\n'
      'DATA: ${options.data.toString()}',
    );

    return handler.next(options);
  },
  onResponse: (response, handler) {
    _logger.d(
      '====== DIO RESPONSE ======\n'
      'URI: ${response.realUri}\n'
      'HEADERS: ${response.requestOptions.headers.toString()}\n'
      'EXTRA: ${response.extra}\n'
      'DATA: ${response.data.toString()}',
    );

    return handler.next(response);
  },
  onError: (error, handler) {
    _logger.e(
      '====== DIO ERROR ======\n'
      'URI: ${error.response?.realUri}\n'
      'Type Data: ${error.type}\n\n\n'
      '===== RESPONSE =====\n'
      'Status Code: ${error.response?.statusCode}\n'
      'Status Message: ${error.response?.statusMessage}\n\n'
      'Is redirect: ${error.response?.isRedirect}'
      'Data: ${error.response?.data.toString()}',
    );

    return handler.next(error);
  },
);
