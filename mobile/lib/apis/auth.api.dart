import 'dart:convert';
import 'package:mobile/models/CustomException.dart';
import 'package:mobile/utils/config.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/models/User.dart';
import '../providers/storage.dart';

Future loginAPI({email, password}) async {
  try {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $jwt'
    };

    var response = await http.post(
      Uri.parse('$webHost/api/auth/login'),
      body: jsonEncode({
        "email": "$email",
        "password": "$password"
      }),
      headers: headers
    );

    Map jsonData = jsonDecode(response.body);

    // print(jsonData);
    box.write('jwt', jsonData['jwt']);


    if (await jsonData['error'] != null) {
      // return null;
      throw jsonData['error']['message'] ?? '';
    }

    return User.fromJson(jsonData['data']);
  }
  catch (e) {
    throw e;
  }
}
