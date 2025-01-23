import 'dart:io';

class Environment {
  static String baseUrl =
      Platform.isAndroid ? 'http://192.168.2.31:3000' : 'http://localhost:3000';
  static String apiUrl = '$baseUrl/api';
  static String socketUrl = baseUrl;
}
