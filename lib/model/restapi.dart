import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RestAPI {
  /// Making it singleton
  factory RestAPI() => _singleton;
  RestAPI._internal();
  static final RestAPI _singleton = RestAPI._internal();

  /// Grab AuthToken
  Future<void> login({required String phone, required String password}) async {
    final response = await http.post(
      Uri.http('/api/auth/client/request'),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: json.encode({'phone': phone, 'password': password}),
    );
    print(response.statusCode);
    if (response.statusCode != 200 && response.statusCode != 201) {
      final decode = json.decode(response.body) as Map<String, dynamic>;

      debugPrint(response.body);
      return Future.error('${response.statusCode}\r\n${decode['message']}');
      // if (decode['constraints'] != null) {
      //   if ((decode['constraints'] as Map<String, dynamic>)['isMobilePhone'] != null) {
      //     return Future.error(
      //       'Не удалось распознать номер телефона. Проверьте правильность введенных данных.',
      //     );
      //   } else {
      //     return Future.error('Неизвестная ошибка.');
      //   }
      // }
    }
  }
}