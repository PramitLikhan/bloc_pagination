import 'dart:convert';

import 'package:http/http.dart' as http;

const _defaultConnectTimeout = 60000;

class ApiClient {
  Future<dynamic> get({required String path, var headers}) async {
    try {
      http.Response response = await http.get(Uri.parse(path), headers: headers).timeout(
            const Duration(milliseconds: _defaultConnectTimeout),
          );
      var temp = jsonDecode(response.body);

      return temp;
    } catch (e) {
      rethrow;
    }
  }
}
