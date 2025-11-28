// ignore_for_file: avoid_print

import 'package:admin_dashboard/services/local_storage.dart';
import 'package:dio/dio.dart';

class CafeApi {
  static Dio _dio = new Dio();

  static void configureDio() {
    _dio.options.baseUrl = 'http://localhost:8080/api';
    _dio.options.headers = {
      'x-token': LocalStorage.prefs.getString('token') ?? '',
    };
  }

  // Resto del código de la clase CafeApi...

  static Future httpGet(String path) async {
    try {
      final resp = await _dio.get(path);
      return resp.data;
    } catch (e) {
      print('Error en GET $path: $e');
      throw ('Webservice GET error');
    }
  }

  static Future httpPost(String path, Map<String, dynamic> data) async {
    final FormData formData = FormData.fromMap(data);

    try {
      final resp = await _dio.post(path, data: formData);
      return resp.data;
    } catch (e) {
      print('Error en POST $path: $e');
      throw ('Webservice POST error');
    }
  }
}
