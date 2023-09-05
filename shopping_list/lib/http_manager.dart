import 'package:http/http.dart' as http;

class HttpManager {
  static const String _baseUrl = 'flutter-prev-default-rtdb.firebaseio.com';
  static const String _path = 'groceries';
  static const String _pathWithJson = '$_path.json';

  static Future<http.Response> get() {
    return http.get(Uri.https(_baseUrl, _pathWithJson));
  }

  static Future<http.Response> post(String body) {
    return http.post(
      Uri.https(_baseUrl, _pathWithJson),
      headers: {
        'Content-Type': 'application/json',
      },
      body: body,
    );
  }

  static Future<http.Response> delete(String id) {
    return http.delete(
      Uri.https(_baseUrl, '$_path/$id.json'),
    );
  }
}
