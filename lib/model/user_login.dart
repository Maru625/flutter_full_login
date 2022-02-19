import 'dart:convert';

import 'package:http/http.dart' as http;

class UserLoginResponse {
  final String nickname;
  final String accessToken;
  final String refreshToken;

  UserLoginResponse(
      {required this.nickname,
      required this.accessToken,
      required this.refreshToken});

  factory UserLoginResponse.fromJson(Map<String, dynamic> json) {
    return UserLoginResponse(
        nickname: json['nickname'],
        accessToken: json['access_token'],
        refreshToken: json['refresh_token']);
  }
}

Future httpUserLogin(String email, String pw) async {
  var response = await http.post(
    Uri.parse('http://0.0.0.0:8000/user/login/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': pw,
    }),
  );
  // if (response.statusCode == 200) {
  //   return UserLoginResponse.fromJson(jsonDecode(response.body));
  // } else if (response.statusCode == 201) {
  //   throw Exception('email error');
  // } else if (response.statusCode == 202) {
  //   throw Exception('password error');
  // }
  return response;
}
