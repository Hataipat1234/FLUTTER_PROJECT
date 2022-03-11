import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ui_tut/Login/login_page.dart';

class APIService {
  Future<LoginPage> login(LoginPage requestModel) async {
    String uri = "http://127.0.0.1/api/login.php";

    final response = await http.post(Uri(), body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginPage.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
